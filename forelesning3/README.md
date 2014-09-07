# [fit]PG5600
# [fit]iOS programmering
## Forelesning 2

---

# Sist gang

* Funksjoner
* Closures
* Enumeration
* Klasser og structs
* Properties
* Metoder
* Access control

---

# Agenda - Swift del 3

* Subscripts
* Arv og kontrutører
* deinit
* ARC
* Optional chaining
* Type casting
* Nested types
* Extentions
* Protocols
* Generics

---

# [fit]Subscripts

---

* _Er snarveier for å hente elementer i en collection, liste eller sekvense_
* _Man kan sette og gette på samme måte_
* _Klasser, structurs og enums kan definere subscripts_
* _Kan vœre read-write eller read only (ref kalkulerte properties)_

___

```swift

class EnKlassemedSubscript {

    ...

    subscript (<parameters>) -> <return type> {
        // man må ha en getter
        get {
            <statements>
        }
        // setter om man ønsker
        set(<setter name>) {
            <statements>
        }
    }
}

```

---

# Dicionary definerer subscripts

```swift

var studenterIfag = ["ios": 10000, "android": 90, "wp": 10]

// Aksesser og sett elementer ved hjelp av key

println(studenterIfag["ios"]) // 10000
studenterIfag["ios"] = 500000

```

---

# Subscript overloading

* _Definere så mange subscript man ønsker_
* _Type inference finner ut hvilke som skal bli brukt_

```swift

class EnKlassemedSubscripts {

    ...

    subscript (pattern: String) -> Bool {

    }

    subscript (willBeDone: Bool) -> String {

    }

    ...
}

```

---

# [fit]Kontrutører

---

* Krever at man bruker navngitte parametre
* Som metoder så kan det droppes ved hjelp av `_`, men anbefales ikke
* Kontanter kan settes i kontruktøren

```swift

class LivingThing {

    let birth: NSDate

    init(birth: NSDate) {
        self.birth = birth
    }
}

var aThing = LivingThing(birth: NSDate())

```

---

* Optionals og verdier med default verdi må ikke settes i kontruktøren

```swift
// base class og superclass

class LivingThing {

    let birth: NSDate
    var death: NSDate?
    var isAlive: Bool = true

    init(birth: NSDate) {
        self.birth = birth
    }

}
```

---

* Man kan ha flere kontruktører og de kan kalle hverandre
* __Designated__- og __Convenience__ kontruktører
* __Convenience__ må til slutt kalle __Designated__

```swift
class LivingThing {
    let birth: NSDate
    var death: NSDate?
    var isAlive: Bool = true

    init(birth: NSDate) {
        self.birth = birth
    }

    convenience init(birth: NSDate, isAlive: Bool) {
        self.init(birth: birth)
        self.isAlive = isAlive
    }
}
```

---

# [fit]Arv

---

En klasse kan arve

* metoder
* properties

og alt annet fra en annen klasse

---

* En klasse som arver fra en annen et kjent som __subclass__
* Klassen som __subclass__ arver fra er kjent som __superclass__
* En klasse som ikke arver av noen er kjent som en __base class__
* En __subclass__ kan kalle metoder, properties, subscripts på __superclass__
* __subclass__ kan overstyrer __superclass__ sine metoder, properties og subscripts

---

```swift
// base class og superclass

class LivingThing {

    let birth: NSDate
    var death: NSDate?

    // Kan ikke overskrives
    final var isAlive: Bool {
        return self.death == nil
    }

    init(birth: NSDate) {
        self.birth = birth
    }

    var description: String {
        return "Jeg er en levende ting som ble født \(self.birth)"
    }
}
```

---

```swift
// subclass og superclass

class Person : LivingThing {
    let firstName: String
    let lastName: String

    var fullName: String {
        return "\(self.firstName) \(self.lastName)"
    }

    // required - gjør at subclass må implementere kontruktøren
    required init(firstName: String, lastName:String, birth: NSDate) {
        self.firstName = firstName
        self.lastName = lastName
        // super kan brukes til å kalle metoder, properties og subscripts
        super.init(birth:birth)
    }

    func sayHello() -> String {
        return "Hello"
    }
}
```

---

```swift
// subclass

class Student : Person {

    // Vil gi kompile error pga required
    init {

    }

    override var description: String {
        return "Student på Westerdals med navn \(self.fullName)"
    }

    override func sayHello() -> String {
        return "Halla lizm"
    }

    // Compile error
    override var isAlive: Bool {
        return true
    }
}

var gunnar = Student(firstName: "Lars", lastName: "Gunnar", birth: NSDate())
gunnar.firstName // Lars
gunnar.description // Student på Westerdals med navn Lars Gunnar

gunnar.birth // 2014-09-07 14:17:59 +0000
```

---

# Deinit

Du kan rydde opp etter deg ved å bruke deinit metoden


```swift
class Student : Person {

    override var description: String {
        return "Student på Westerdals med navn \(self.fullName)"
    }

    override func sayHello() -> String {
        return "Halla lizm"
    }

    deinit {
      School.removeStudent(self.id)
    }
}
```

---

# [fit] ARC

---

- Implisitt sterk referanse
- Bruk weak for å si at man ikke ønsker å øke referansetelleren
- En weak kan ikke vœre en konstant

```swift

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { println("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: Person?
    deinit { println("Apartment #\(number) is being deinitialized") }
}

```

---

- Bruk unknown i stedet for weak der du vet at verdien alltid vil vœre satt

```swift
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { println("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { println("Card #\(number) is being deinitialized") }
}
```

---

# [fit]Se boken for mer informasjon om minnehåndtering i Swift

---

# [fit]Optional Chaining

---


# [fit]Oppgaver

##[fit] Se [Øvingsoppgavene](oppgaver3.md)
