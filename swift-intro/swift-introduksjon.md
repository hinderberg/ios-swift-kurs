![](wwdc.png)

^ Under utviklerkonferansen WWDC i starten av Juni, lanserte Apple ganske så uventet et nytt programmeringsspråk kalt Swift.

---

![](swift-logo-hero.jpg)

^ kalt Swift.

---

## Et nytt programmeringsspråk for iOS og OS X
#### _Cocoa Touch og Cocoa_

---

## Førte til reaksjoner som dette

![fit inline](tweet-trash.png)

---

## og dette

![100% inline](tweet-mattt.png)

---

#### _Som igjen førte til_

## Introduksjon til Swift

---

### Hans Magnus Inderberg
#### BEKK, SpareBank 1 Mobilbank
#### Fagleder Mobil
#### _@hinderberg_

---

# Hva er Swift?
* _Laget av Apple_
* _Fokus på sikkerhet og enkelhet i språket_
* _Fungerer side-om-side med Objetice-C_
* _Utviklet i omtrent 4're år allerede_
* _Det forener flere paradigmer som imperativ og OOP og funksjonelt_  

^ Swift er laget av Apple og tar i bruk mange kjente paradigmer som vi kjenner fra andre språk.
De sier at språket har fokus på sikkerhet og det merkes ved at kompileren er
flink til å finne utvikler feil og at de tvinger utviklere til å bruke visse patterns når de utvikler.
Enkelheten kommer frem i den lette syntaxen, de har for eksempel fjernet semi-kolon.
Mye inspirasjon kan man si at har blitt hentet fra språk som .NET familien, spesielt
F#, Java, Lisp, JavaScript, Diverse funksjonelle språk.

---

# Hvordan ser det ut?

---

# Variabler

```swift
// let - Konstant
// var - Variabel

// Uten definering av type
var numberVariable = 42
numberVariable = 50
let numberConstant = 42

// Med definert type
var stringVariable: String = "Hello World"
stringVariable = "Hello BEKK"
let stringConstant: String = "Hello World"
```

^ Kontakter deklareres med let og variabler med var
En konstakt kan bare bli satt en gang, men det må ikke skje ved kompilering.

^ Type interence er et stort fokus punkt i Swift og de bruker det både oppover og nedover i type-treet.
Det vil si at om du ikke spesifiserer typen, så vil det analysere output av det du setter variabelen din til for å finne typen.
Men om du setter typen, så vi den typen overskrive den faktiske typen. For eksempel hvis du setter en Double til å vœre Float.

---

# Strenger

```swift
var variableString = "Bekk"
variableString += " Consulting"
// variableString er nå Bekk Consulting"

let constantString = "Bekk"
constantString += " Consulting"
// kompilatoren sier da: error - constantString cannot be changed

// String Interpolation
let number1 = 10, number2 = 8
let mathString = "\(number1) ganger \(number2) er \(number1 * number2)"
```

^Strenger kan kombineres ved hjelp av steng interpolation. Der man også kan skrive utrykk.

---

# Collection types

_Det finnes to typer collections i Swift_

* _Arrays_
* _Dictionaries_

---

# Array

```swift
// Deklaring, merk ingen spesifisering av type

var names = ["Aleksander", "David", "Anders"]

// Uthenting

names[0]

// Modifisering

names += "Jon"
todo += ["Lars", "Linda"]
todo[0] = "Aleksander Ny"
todo[2..<5] = ["Svein", "Gro", "Johanne"]
```

^ Et array deklareres på veldig standard måte, med to klammer. Uthenting er som vanlig.
Men ved modifisering har de blitt litt morsomme. Du bruker + for å legge til og på eksempelet i bunn så brukes noe de kaller Ranges, mer om det litt senere.

---

# Dicionary

```swift
// Deklaring

var people = ["Jon" : 30, "Lars" : 21, "Linda" : 18]

// Uthenting

people["Jon"]

// Modifisering

people["Jon"] = 35
people["Linda"] = 81
```

^ I dicionary så holdes ting på normalt nivå og mange av dere kjenner nok igjen dette fra andre språk.

---

# Løkker

_Det finnes fire typer løkker_

* _while_
* _do-while_
* _for_
* _for-in_

---

# while og do-while

```swift
while !complete {
	println("Henter informasjon...")
}

var message = "Starter henting av informason"
do {
	println(message)
	message = "Henter.."
} while !complete
```

^ Ikke noe nytt i while og do-while, og dette er veldig kjent for de fleste.

---

# for og for-in

```swift
for var i = 1; i < people.count; ++i {
	println(people[i])
}

for person in people {
	println(person)
}
```

^ Samme her, ikke mye nytt. Man har for og for-in

---

# Ranges


* _1…10 – Går fra 1 til 10. Og er kjent som en closes range._
* _1..<10 – Går fra 1 til 9. Og er kjent som en half-closed range_

```swift
for number in 1...10 {
	println("\(number) ganger 2 er \(number*2)")
}

```

^ Ranges, viste vi tidligere om hvordan man kunne modifisere en array. Men de kan brukes til mye forskjellige.
Prat om punktene og gå igjennom eksempel

---

# Control flow

* _if_
* _switch_

---

# if

* _Ikke noe nytt, paranters er optional_

```swift

if age == 11 {
	println("Ung")
} else if age == 80 {
	println("Gammel")
} else {
	println("I mellom en plass?;)")
}
```

---

# switch

_Her har de gått banans_

* _Du trenger ikke bruke break etter hver case_
* _Du kan bruke hvilke som helst object i en switch_
* _switch'en må matche alle case mulig, hvis du utelater default case, ellers blir det compile error_

---

```swift
switch age {
	case 11:
		println("Ung")
	case 12:
		println("Gammel")
	default:
		println("I mellom en plass?;)")
}
```

---

# Du kan bruke flere verdier per case

```swift
switch age {
	case 0:
		println("Nyfødt")
	case 1,2,3:
		println("Spebarn")
	case 4,5,6,7,8,9,10:
		println("Barn")
	default:
		println("Gammal!")
}
```
---

# Du kan bruke ranges

```swift
switch age {
	case 0:
		println("Nyfødt")

	case 1..10:
		println("Barn")

  case 10..20:
      println("Ungdom")

	case 20..100 :
		println("Voksen")

	default:
		println("Gammel")

}
```

---

# Du kan switche på instanser

``` swift
switch sender {
  case executeButton:
    println("You tapped the Execute button")
  case firstNameTextField:
    println("You tapped the First Name text field")
  default:
    println("You tapped some other object")
}
```

^ Man kan også switche på instanster av forskjellige typer.

---

# Funksjoner

* _Deklareres med `func`_
* _Return typen defineres til slutt_

---

```swift
func printName() {
  println("Jenny")
}
printName()

// med parametre, konstanter hvis ikke spesifisert at de skal vœre variabler
// med da blir de kopiert. Med mindre man bruker inout

func printName(name: String) {
  println(name)
}
printName("Jenny")

// med default verdi

func printName(name: String = "Jenny") {
  println("Hello \(name)!")
}
printName()
printName(name: "Olga")
```
---

# Funksjoner - Returverdi

```swift
func buildName(
  firstName: String,
  lastName: String) -> String {
	return "\(cardName) \(cardValue)"
}
```
---

# Funksjoner - Navngitte parametre

```swift
func buildName(
    yourFirstName firstName: String,
    #lastName: String) -> String {
        return "\(firstName) \(lastName)"
}
```
---

# Funksjoner - Tuple/Flere returverdier

```swift
func refreshWebPage() -> (Int, String) {
  return (200, "success")
}
let (statusCode, message) = refreshWebPage()

// Felter i tuple

func refreshWebPage() -> (code: Int, message: String) {
  return (200, "success")
}

let status = refreshWebPage()
println("Fikk status \(status.code): \(status.message)")
```
---

# Funksjoner - Med x antall av samme type

```swift
func total(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total;
}

total(1, 2, 3, 4, 5)
```

---

# Funksjoner - som parametre

```swift
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
```

---

# Nestede funksjoner

```swift
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
```

---

# Closures

```swift
{ (parameters) -> return type in
    statements
}

reversed = sorted(names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```
---

# Closures - Shorthands

```swift
// Type inference

reversed = sorted(names, { s1, s2 in return s1 > s2 } )

// Implicit Returns from Single-Expression Closures

reversed = sorted(names, { s1, s2 in s1 > s2 } )

// Shorthand arguments names

reversed = sorted(names, { $0 > $1 }

// Swift’s String type definerer sin spesifikke implementasjon av > operatoren som en funksjon
// som har to paramerte av typen string og returnerer Bool
reversed = sorted(names, >)
```
---

# Closures - Parametre

```swift
func repeat(count: Int, task: () -> ()) {
  for i in 0..count {
    task()
  }
}

repeat(2, {
  println("Hello!")
})

//Trailing closure

repeat(2) {
  println("Hello!")
}
```

---

# Klasser og Structs

```swift
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```

^Et eksempel på stored properties

---

# Klasser og structures har mye til felles
* _Definere properties_
* _Definere metoder_
* _Definere subscripts - Snarveier for å hente verdier_
* _Definere initializers for å sette opp deres oppstarts state_
* _Blir utvidet av andre klasser og bruke protocols for å vise at de har spesifikk funksjonalitet_

---

# Klasser kan i tillegg

* _Bruke arv_
* _Type casting - Man kan sjekke og tolke typen runtime_
* _Bruke Deinitializers - for å rydde opp når instansen skal bli kastet_
* _Referanse telling - mer enn en referanse til en klasseinstans_
* _Klasser er Reference Types og Structs er Value Types_

^ Value Types blir kopiert når man assigner dem til en ny variabel eller konstant
Reference types øker bare antall pekere til det samme objektet.

---

# Eksempel

```swift
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 1400
// her blir hd ikke endret

var mode = VideMode(name: "Cool Mode")
sameMode = mode
sameMode.name = "Other Mode"
// her vil både mode og sameMode sitt name når vœre Other Mode
```

---

# Access Control

* _Access Control på klasser, structs, metoder, properties, etc._

```swift
public class SomePublicClass {}

internal class SomeInternalClass {}
private class SomePrivateClass {}
```

---

# Kalkulerte properties

```swift
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) { // må ikke ta inn noe, da kan man bruke newValue i stedet
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
```

---

# READ-only

```swift
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
```

---

# Obseravble properties

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            println("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                println("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
```

---

# Metoder

```swift
class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
```

---

# class, static

```swift
static (type functions) in classess

class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}

struct SomeStruct {
    static func someTypeMethod() {
        // type method implementation goes here
    }
}
```

---

# muetating

* For å modifisere properties på value types, så må man bruke mutating

```swift
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
```

---

# Arv

* Bruk final hvis du ikke ønsker at man skal kunne bruke override ved arv

```swift
class Train: Vehicle {
    override func makeNoise() {
        println("Choo Choo")
    }
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }

    override var currentSpeed: Double {
      didSet {
          gear = Int(currentSpeed / 10.0) + 1
      }
  }
}
```

---

# Når bruke struct

* _Når du skal enkapsulere enkle dataverdier_
* _Når verdiene bør bli kopiert og ikke referert til_
* _Når alle properties i structuren er value types_
* _Når man ikke trenger arv fra andre typer_

Eksempel: _String, Array og Dictionary er structures_

---

# Enums

```swift
enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

```

---

# Enums Raw og Associated verdier

```swift
// Enumeration Raw Values
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// Enumeration Associated Values
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
```

---

# Optional og optional chaining

* _Gjør at man får compile error om man ikke har sjekker for nil først_

---
```swift
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

var optionalString: String? = "Hello"
optionalString == nil

// unwrapping
let roomCount = john.residence!.numberOfRooms

// Automatisk unwrapping og sette verdien i en if

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
```

---

# Optional chaining

```swift
if let johnsStreet = john.residence?.address?.street {
    println("John's street name is \(johnsStreet).")
} else {
    println("Unable to retrieve the address.")
}
```

---

# Protocols

* _Samme som interface i Java og andre språk_
* _Definerer opp et sett med metoder, properties, klasse metoder, operatorer og subscripts som passer en bestemt funksjonalitet_
* _Inneholder ingen implementasjonskode_

```swift
protocol SomeProtocol {
}
```

---

# Extentions

* _Utvide funksjonalitet for en bestemt type_

---

* _Kan legge til:_
* _Vanlig og static kalkulerte properties_
* _Definere nye instansmetoder og klassemetoder_
* _Nye init metoder_
* _Nye subscripts_
* _Definere ny nestet type_
* _Gjøre slik at en eksiterende type conforms til en protocol_

---

```swift
extension SomeType {
    // new functionality to add to SomeType goes here
}
```

---

# Generics


Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.

Generics are one of the most powerful features of Swift, and much of the Swift standard library is built with generic code. In fact, you’ve been using generics throughout this Language Guide, even if you didn’t realize it. For example, Swift’s Array and Dictionary types are both generic collections. You can create an array that holds Int values, or an array that holds String values, or indeed an array for any other type that can be created in Swift. Similarly, you can create a dictionary to store values of any specified type, and there are no limitations on what that type can be.

The Problem That Generics Solve

Here’s a standard, non-generic function called swapTwoInts, which swaps two Int values:

func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
This function makes use of in-out parameters to swap the values of a and b, as described in In-Out Parameters.

The swapTwoInts function swaps the original value of b into a, and the original value of a into b. You can call this function to swap the values in two Int variables:

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3"
The swapTwoInts function is useful, but it can only be used with Int values. If you want to swap two String values, or two Double values, you have to write more functions, such as the swapTwoStrings and swapTwoDoubles functions shown below:

func swapTwoStrings(inout a: String, inout b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
You may have noticed that the bodies of the swapTwoInts, swapTwoStrings, and swapTwoDoubles functions are identical. The only difference is the type of the values that they accept (Int, String, and Double).

It would be much more useful, and considerably more flexible, to write a single function that could swap two values of any type. This is the kind of problem that generic code can solve. (A generic version of these functions is defined below.)

NOTE

In all three functions, it is important that the types of a and b are defined to be the same as each other. If a and b were not of the same type, it would not be possible to swap their values. Swift is a type-safe language, and does not allow (for example) a variable of type String and a variable of type Double to swap values with each other. Attempting to do so would be reported as a compile-time error.

Generic Functions

Generic functions can work with any type. Here’s a generic version of the swapTwoInts function from above, called swapTwoValues:

func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
The body of the swapTwoValues function is identical to the body of the swapTwoInts function. However, the first line of swapTwoValues is slightly different from swapTwoInts. Here’s how the first lines compare:

func swapTwoInts(inout a: Int, inout b: Int)
func swapTwoValues<T>(inout a: T, inout b: T)
The generic version of the function uses a placeholder type name (called T, in this case) instead of an actual type name (such as Int, String, or Double). The placeholder type name doesn’t say anything about what T must be, but it does say that both a and b must be of the same type T, whatever T represents. The actual type to use in place of T will be determined each time the swapTwoValues function is called.

The other difference is that the generic function’s name (swapTwoValues) is followed by the placeholder type name (T) inside angle brackets (<T>). The brackets tell Swift that T is a placeholder type name within the swapTwoValues function definition. Because T is a placeholder, Swift does not look for an actual type called T.

The swapTwoValues function can now be called in the same way as swapTwoInts, except that it can be passed two values of any type, as long as both of those values are of the same type as each other. Each time swapTwoValues is called, the type to use for T is inferred from the types of values passed to the function.

In the two examples below, T is inferred to be Int and String respectively:

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

---

# Playground

n seemingly almost approach swift as a scripting language – the first line in your source file can be functioning application code, no boilerplate required! A
Scala Workspaces or F# interactive mode

Kjører kode forløpende
Tidslinje som skriver ut alt som skjer i en prosess (for eksempel for loop, eller kompsisjon av views, eller animert SpriteKit scene)

Eksempel bruk:

Design a new algorithm, watching its results every step of the way
Create new tests, verifying they work before promoting into your test suite
Experiment with new APIs to hone your Swift coding skills

---

# REPL

###### _read–eval–print loop støtte_
###### _Startes med ```xcrun swift```_

---

```swift
#!/usr/bin/env xcrun swift

import Cocoa
import Appkit

var arguments = Process.arguments;
arguments.removeAtIndex(0)

if arguments.count != 1 {
    println("Usage: ./wallpaper.swift -- [wallpaper path]")
    exit(1)
}

let path = arguments[0]
println("Finding wallpaper at path: " + path)

var workspace = NSWorkspace.sharedWorkspace()
var screen = NSScreen.mainScreen()

var imgurl : NSURL = NSURL.fileURLWithPath(path)
var error : NSError?
var result : Bool = workspace.setDesktopImageURL(imgurl, forScreen: screen, options: nil, error: &error)

if result {
    println("Wallpaper set!")
} else {
    println("Failed setting wallpaper")
}
```

---

# Swift er ikke ferdig


Simply put, if you write a Swift app today and submit it to the App Store this Fall when iOS 8 and OS X Yosemite are released, you can trust that your app will work well into the future. In fact, you can target back to OS X Mavericks or iOS 7 with that same app. This is possible because Xcode embeds a small Swift runtime library within your app’s bundle.

While your app’s runtime compatibility is ensured, the Swift language itself will continue to evolve, and the binary interface will also change. To be safe, all components of your app should be built with the same version of Xcode and the Swift compiler to ensure that they work together.

This means that frameworks need to be managed carefully. For instance, if your project uses frameworks to share code with an embedded extension, you will want to build the frameworks, app, and extensions together. It would be dangerous to rely upon binary frameworks that use Swift — especially from third parties. As Swift changes, those frameworks will be incompatible with the rest of your app. When the binary interface stabilizes in a year or two, the Swift runtime will become part of the host OS and this limitation will no longer exist.

---

# [fit] Spørsmål _**[?]**_

---

# [fit] Gira?
# [fit] Stikk å programer Swift
# [fit] _**Lykke til!**_
