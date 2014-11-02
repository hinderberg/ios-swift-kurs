# [fit]PG5600
# [fit]iOS programmering
## Forelesning 10 - Persistering

---

# Agenda

* Hvor filer lagres
* Enkel lesing og skriving til disk
* NSUserDefaults
* NSKeyedArchiver / NSKeyedUnarchiver
* Core Data

---

# Hvor filer lagres

```swift
let fm = NSFileManager.defaultManager()
        
// <app home>/Documents, backes opp, kan bli vist til bruker
// For brukerens datafiler 
println(fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0])

// <app home>/Library, backes opp, skjult
// For det som ikke er brukerens datafiler 
println(fm.URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)[0])

// <app home>/Library/Caches, backes IKKE opp, skjult
// F.eks. for caching av bilder
println(fm.URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask)[0])

// <app home>/tmp, backes IKKE opp
// For midlertidige filer som ikke trenger å eksistere mellom launches
println(NSTemporaryDirectory())
```

---

# Skriv og les string til disk

```swift
let dir = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, 
		inDomains: .UserDomainMask)[0] as NSURL
        
let string: NSString = "Hello world"

let path = dir.URLByAppendingPathComponent("file.txt").path!
var writeError: NSError?
if(!string.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: &writeError)) {
    println("Write failed: \(writeError)")
}

var readError: NSError?
if let savedString = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &readError) {
    println(savedString)
} else {
    println("Read failed: \(readError)")
}

```

---

# Skriv og les NSDictionary til plist

```swift
let dir = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, 
				inDomains: .UserDomainMask)[0] as NSURL
let dict = ["workouts": 23] as NSDictionary
println(dir)

let path = dir.URLByAppendingPathComponent("file.plist").path!

// Skriv
dict.writeToFile(path, atomically: true)

// Les
println(NSDictionary(contentsOfFile: path))
```

---

# NSUserDefaults

---

# NSUserDefaults

* For enkle verdier og caser
* Eksempel: lagre brukerens preferanser
* Verdier caches slik at man slipper diskaksess ved hver henting
* Synkronisering av verdier mot disk skjer automatisk ved jevne mellomrom

---

```swift
let userDefaults = NSUserDefaults.standardUserDefaults()
userDefaults.setObject("Tim Cook", forKey: "name")

if let name = userDefaults.stringForKey("name") {
    println("Got Name: \(name)")
}

// Tving synkronisering mot disk
userDefaults.synchronize()
```

---

# NSKeyedArchiver / NSKeyedUnarchiver

---

# NSKeyedArchiver / NSKeyedUnarchiver

* For serialisering av objekter til disk
* Klasser som skal serialiseres må implementere NSCoding-protokollen. Mange standard datatyper gjør dette allerede.
* [Pass på fremover og bakoverkompatibilitet](https://developer.apple.com/library/mac/documentation/cocoa/conceptual/Archiving/Articles/compatibility.html)

---

# Klasse som implementerer NSCoding

```swift
class Workout : NSObject, NSCoding {
    var name: String!
    var entries: Int = 0
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        name = aDecoder.decodeObjectForKey("name") as String?
        entries = aDecoder.decodeIntegerForKey("entries")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInteger(self.entries, forKey: "entries")
    }
}
```

---

# Eksempel serialisering og deserialisering

```swift
let fm = NSFileManager.defaultManager()
        
let libDir = fm.URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)[0] as NSURL
println(libDir)

let workout = Workout()
workout.entries = 14
workout.name = "Pull-ups"

let path = libDir.URLByAppendingPathComponent("workouts").path!

// Serialisere til disk
NSKeyedArchiver.archiveRootObject(workout, toFile: path)

// Deserialisere fra disk
let savedWorkout = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as Workout
println("\(savedWorkout.name), entries: \(savedWorkout.entries)")
```

---

# Core Data

---

# Core Data

For mer komplekse behov, når du trenger:

* Å lagre objektgrafer (med relasjoner)
* Å gjøre spørringer mot objektgrafer
* Støtte undo/redo
* Lagre objektgrafer i iCloud

---

![fit](img/nshipster1.png)

---

![fit](img/nshipster2.png)

---

# Terminologi

* **Managed Object Context** - "hovedobjektet" mot Core Data. Håndterer et sett Managed Objects og deres lifssyklus 
* **Persistent Store Coordinator** - abstraherer bort underliggende store. Implementerer henting/lagring/sletting/m.m. av MOM mot store
* **Managed Object Model** - som et slags databaseskjema
* **Persistent Object Store** - XML, SQLite, Binær, custom

![fit right](img/coredata.png)

---

# ManagedObjectContext

```swift
lazy var managedObjectContext: NSManagedObjectContext? = {
    let coordinator = self.persistentStoreCoordinator
    if coordinator == nil {
        return nil
    }
    var managedObjectContext = NSManagedObjectContext()
    managedObjectContext.persistentStoreCoordinator = coordinator
    return managedObjectContext
}()
```

---

# PersistentStoreCoordinator

```swift
lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {

    var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(
    		managedObjectModel: self.managedObjectModel)
    let url = self.applicationDocumentsDirectory.
    				URLByAppendingPathComponent("Workouts.sqlite")
    var error: NSError? = nil
 
    if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, 
    	URL: url, options: nil, error: &error) == nil {
        coordinator = nil
        //... feilhåndtering, se XCode template
    }
    
    return coordinator
}()
```

---

# ManagedObjectModel

```swift
lazy var managedObjectModel: NSManagedObjectModel = {
    let modelURL = NSBundle.mainBundle().URLForResource("Workouts", 
    	withExtension: "momd")!
    return NSManagedObjectModel(contentsOfURL: modelURL)!
}()
```

---

# Managed Objects

![inline](img/managedobject.png)

I utgangspunktet NSManagedObject's med key/value. Disse **kan** og **bør** ofte ha en subklasse for renere kode og mer funksjonalitet, men må ikke

---

# Fetch Requests

![inline](img/fetchrequest.png)

---

# Hent alle

```swift
let query = NSFetchRequest(entityName: "Workout")
var error: NSError?
if let results = moc.executeFetchRequest(query, error: &error) as? [Workout] {
    workouts = results
    //tableView.reloadData()
} else {
    println("Query failed: \(error)")
}
```

---

# Fetch med predikat

```swift
var query = NSFetchRequest(entityName: "Workout")
query.predicate = NSPredicate(format: "entries >= %d", 5)

var error: NSError?
if let results = moc.executeFetchRequest(query, error: &error) as? 
	[Workout] {
    workouts = results
    //tableView.reloadData()
} else {
    println("Query failed: \(error)")
}
```

---

# Sortering og limit

```swift
// Hent topp 3
var fetchRequest = NSFetchRequest(entityName: "Workout")
fetchRequest.sortDescriptors = [NSSortDescriptor(key: "entries", ascending: false)]
fetchRequest.fetchLimit = 3
```

---

# Opprett

```swift
let entity = NSEntityDescription.entityForName("Workout", 
				inManagedObjectContext: moc)
var workout = Workout(entity: entity!, 
				insertIntoManagedObjectContext: moc)
workout.name = excersice
workout.entries = 0

var error: NSError?
if moc.save(&error) {
    workouts.append(workout)
    //tableView.reloadData()
} else {
    println("Save failed \(error)")
}
```

---

# Endre

```swift
//let workout = workouts[indexPath.row]
workout.entries = workout.entries.integerValue + 1

var error: NSError?
if(moc.save(&error)) {
    tableView.reloadData()
} else {
    println("Failed to update: \(error)")
}
```

---

# Slett

```swift
//let workoutToRemove = workouts[indexPath.row]
moc.deleteObject(workoutToRemove)
```

---

# Telle

```swift
let fetchRequest = NSFetchRequest(entityName: "Workout")
let count = moc.countForFetchRequest(fetchRequest, error: nil)
println("\(count) øvelser registrert")
```

---

# Mer

* NSFetchedResultsController
* Validering
* Relasjoner
* Versjonering
* Core Data i iCloud

---

# Keychain

* For lagring av sensitive data (passord m.m.)
* C API
* Se "iOS Keychain Services Tasks" i dokumentasjonen for mer info

---

# [fit]Oppgaver

##[fit] Se [Øvingsoppgavene](oppgaver.md)

##[fit] https://github.com/hinderberg/ios-swift-kurs