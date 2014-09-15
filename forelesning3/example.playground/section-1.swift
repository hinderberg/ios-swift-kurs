// Playground - noun: a place where people can play

import UIKit

// OPPGAVE 1

struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    subscript (row: Int, column: Int) -> Double {
        get {
            return grid[(row * columns) + column]
        }
        set {
            grid[(row * columns) + column] = newValue
        }
    }
}


var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 0
matrix[1, 0] = 1
matrix[0, 1] = 2
matrix[1, 1] = 3

matrix

// OPPGAVE 2

class Time {
    var hour: Int
    var minute: Int
    var second: Int
    
    var running: Bool = false
    var startedAt: NSDate?
    var stoppedAt: NSDate?
    
    init(hour: Int, minute:Int, second:Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    convenience init(hour: Int) {
        self.init(hour: hour, minute: 0, second: 0)
    }
}

var time = Time(hour: 10, minute: 0, second: 0)
var time2 = Time(hour: 2)

// OPPGAVE 4, 5, 6, 7, 8

class Address {
    var street: String?
    
    func printStreet() {
        println("Hello")
    }
    
    func buildFullStreetName() -> String? {
        return street
    }
}

class Student {
    var address: Address?
}

class School {
    var students: [Student]?
}

let westerdals = School()
let student = Student()
let address = Address()
address.street = "Hello Street"

let otherAddress = Address()
address.street = "Hello Street"
student.address = address
westerdals.students = [Student]()
westerdals.students?.append(student)

if let street = westerdals.students?.first?.address?.street {
    println("Studenten bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
}

if westerdals.students?.first?.address?.printStreet() != nil {
    println("Det gikk bra å kalle print funksjonen")
} else {
    println("Jeg kunne ikke kalle metoden")
}

if (westerdals.students?.first?.address = otherAddress) != nil {
    println("Du satt en ny addresse")
} else {
    println("Det var ikke mulig å sette en ny addresse")
}

if let fullStreetName = westerdals.students?.first?.address?.buildFullStreetName() {
    println("Fullstendig gatenavn er \(fullStreetName)")
} else {
    println("Kunne ikke hente fullstendig gatenavn")
}

if let fullStreetName = westerdals.students?[0].address?.buildFullStreetName() {
    println("Fullstendig gatenavn er \(fullStreetName)")
} else {
    println("Kunne ikke hente fullstendig gatenavn")
}


// Oppgave 9

extension String {
    var length:Int {
        return countElements(self)
    }

    func contains(string:String) -> Bool {
        if(self.rangeOfString(string) != nil) {
            return true
        } else {
            return false
        }
    }
    
    func reverse() -> String {
        var reverseString = ""
        for char in self {
            reverseString = String(char) + reverseString
        }
        return reverseString
    }
}

"AB".length
"AB".reverse()
"Abba".contains("AbA")
"Abba".contains("Abb")

// Oppgave 10

extension NSDate {
    func daysBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        return fabs(diff/86400)
    }
}

NSDate().daysBetweenDate(NSDate(timeIntervalSinceNow: 3.15569e10))

// Oppgave 11
class Container<T: Hashable> {
    var storage = Dictionary<T, Int>()
    
    init(items: T ...) {
        for item in items {
            self.addItem(item)
        }
    }
    
    func addItem(item: T) {
        if let count = storage[item] {
            self.storage[item] = count + 1
        } else {
            self.storage[item] = 1
        }
    }
    
    func removeItem(item: T) {
        if let count = storage[item] {
            if (count > 1) {
                self.storage[item] = count - 1
            } else {
                self.storage.removeValueForKey(item)
            }
        }
    }
}

extension Container : SequenceType {
    typealias GeneratorType = ContainerGenerator<T>
    func generate() -> ContainerGenerator<T>{
        return ContainerGenerator<T>(backingDictionary: storage)
    }
}

struct ContainerGenerator<T:Hashable> : GeneratorType {
    var generator : DictionaryGenerator<T, Int>
    init(backingDictionary : Dictionary<T, Int>) {
        self.generator = backingDictionary.generate()
    }
    typealias Element = (T, Int)
    mutating func next() -> (T, Int)? {
        return self.generator.next()
    }
}

class ContainerItem: Hashable, Printable {
    let description: String
    
    init(description: String) {
        self.description = description
    }
    
    var hashValue: Int {
        get {
            return (31 &* self.description.hashValue)
        }
    }
}

func == (lhs: ContainerItem, rhs: ContainerItem) -> Bool {
    return lhs.description == rhs.description
}

class Shirt: ContainerItem {}
class Shorts: ContainerItem {}

// Oppgave 1
var container = Container<ContainerItem>()

// Oppgave 2
let myFavoriteShirt = Shirt(description: "One of my favorite shirts")
let myFavoriteShorts = Shorts(description: "My favorite shorts")
let myOtherShirt = Shirt(description: "My other shirt")

container.addItem(myFavoriteShirt)
container.addItem(myFavoriteShirt)
container.addItem(myFavoriteShorts)
container.addItem(myOtherShirt)

// Oppgave 3
container.removeItem(myFavoriteShirt)

// Oppgave 4
for (obj, count) in container {
    println(obj.description, count)
}

