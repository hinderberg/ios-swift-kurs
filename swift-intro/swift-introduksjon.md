![](wwdc.png)

^ Under utviklerkonferansen WWDC i starten av Juni, lanserte Apple ganske så uventet et nytt programmeringsspråk kalt Swift.

---

![](swift-logo-hero.jpg)

^ kalt Swift.

---

## Et nytt programmeringsspråk for iOS og OS X

---

## Som førte til reaksjoner som dette

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
* _Forener flere paradigmer som imperativ, OOP og funksjonelt_  

^ Swift er laget av Apple og tar i bruk mange kjente paradigmer og  som vi kjenner fra andre språk.
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

^ Konstanter deklareres med LET og variabler med VAR
En konstant kan bare bli satt en gang, men det må ikke skje ved kompilering.

^Type interence er et stort fokus punkt i Swift og de bruker det både oppover og nedover i type-treet.
Det vil si at om du ikke spesifiserer typen, så vil det analysere output av det du setter variabelen din til for å finne typen.

^Men om du setter typen, så vi den typen overskrive den faktiske typen.
For eksempel hvis du setter en Double til å vœre Float.

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

^Strenger kan kombineres ved hjelp av streng interpolation. Der man også kan skrive matematiske utrykk.
^Det er også laget broer mellom Objective-C sine NSString klasse og Swift String, noe som gjør at man kan benytte disse om hverandre.

---

# Collection types

_Det finnes to typer collections i Swift_

* _Arrays_
* _Dictionaries_


^ De vanlige typene finnes også i Swift

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
Men ved modifisering har de blitt litt morsomme.
Du bruker + for å legge til og på eksempelet i bunn så brukes noe de kaller Ranges, mer om det litt senere.

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

^ Ikke noe nytt her altså, og de gjøres på vanlig måte

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

for number in 1..<10 {
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
if age <= 10 {
    println("Barn")
} else if age >= 80 {
    println("Gammel")
} else {
    println("I mellom en plass?;)")
}
```

---

# switch

_Her har de gått banans_

* _Du trenger ikke bruke break etter hver case_
* _Bruk hvilke som helst object i en switch_
* _switch'ene må matche alle case, hvis du utelater default case,
hvis ikke blir det compile error_

---

```swift
switch age {
case 1,2,3,4,5,6,7,8,9,10:
    println("Barn")
case 80...100:
    println("Gammel")
default:
    println("I mellom en plass?;)")
}
```

---

# Du kan switche på instanser

``` swift
switch sender {
  case childButton:
    println("Du er et barn!")
  case oldisButton:
    println("Du er gammal!")
  default:
    println("I mellom en plass?;)")
}
```

^ Man kan også switche på instanster av forskjellige typer.

---

# Funksjoner

* _Deklareres med `func`_
* _Returtypen defineres til slutt_

---

```swift
func printName() {
  println("Olga")
}
printName()
```

---

```swift
// med parametre
// default konstanter
// hvis ikke spesifisert at de skal vœre variabler
// med da blir de kopiert. Med mindre man bruker `inout`

func printName(name: String) {
  println(name)
}
printName("Olga")
```

---

```swift
// med default verdi

func printName(name: String = "Olga") {
  println("Hallo \(name)!")
}
printName()
printName(name: "Geir")
```
---

# Funksjoner - Returverdi

```swift
func buildName(firstName: String, lastName: String) -> String {
	return "\(firstName) \(lastName)"
}
buildName("Olga", "Geiresen")
```
---

# Funksjoner - Navngitte parametre

```swift
func buildName(
    yourFirstName firstName: String,
    #lastName: String) -> String {
        return "\(firstName) \(lastName)"
}
buildName(yourFirstName: "Olga", lastName: "Geiresen")
```
---

# Funksjoner - Tuple/Flere returverdier

```swift
func refreshWebPage() -> (Int, String) {
  return (200, "success")
}
let (statusCode, message) = refreshWebPage()
println("Fikk status \(statusCode): \(message)")
```

---

```swift

// Navngi felter i tuple returverdi

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
    println("Ble: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)
```

---

# Nestede funksjoner

---

```swift
func jump(method: String) -> (Int) -> String {
    func vertizal(lenght: Int) -> String { return "Jeg hoppet \(lenght)m fremover" }
    func horizontal(height: Int) -> String { return "Jeg hoppet \(height)m høyt" }
    func notJumping(lenght: Int) -> String { return "Jeg droppet å hoppe \(lenght)m" }

    if method  == "vertical" {
        return vertizal
    } else if method == "horizontal" {
        return horizontal
    } else {
        return notJumping
    }
}

println(jump("vertical")(1))
println(jump("horizontal")(2))
println(jump("")(2))
```

---

# Closures

```swift
{ (parameters) -> return type in
    statements
}
```

---

```swift
reversed = sorted(names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```
---

# Closures på speed

---

```swift
// Type inference

reversed = sorted(names, { s1, s2 in return s1 > s2 } )
```

---

```swift
// Implicit Returns from Single-Expression Closures

reversed = sorted(names, { s1, s2 in s1 > s2 } )
```

---

```swift
// Shorthand arguments names

reversed = sorted(names, { $0 > $1 }
```

---

```swift
/*
Swift’s String type definerer sin
spesifikke implementasjon av > operatoren som en funksjon
som har to paramerte av typen string og returnerer Bool
*/
reversed = sorted(names, >)
```
---

# Closures som parametre

```swift
func repeat(count: Int, task: () -> ()) {
  for i in 0..<count {
    task()
  }
}

repeat(2, {
  println("BEKK!")
})
```

---

# Trailing closure
```swift
repeat(2) {
  println("BEKK!")
}
```

---

# Klasser og Structs

* _Klasser er Reference Types og Structs er Value Types_

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
* _Definere initializers for å sette opp state_
* _Kan bruke extentions_
* _Kan bruke protocols_

---

# Klasser kan i tillegg

* _Kan bruke arv_
* _Type casting - Man kan sjekke og tolke typen runtime_
* _Bruke Deinitializers - for å rydde opp når instansen skal bli kastet_
* _Referanse telling - mer enn en referanse til en klasseinstans_

^ Value Types blir kopiert når man assigner dem til en ny variabel eller konstant
Reference types øker bare antall pekere til det samme objektet.

---

# Eksempel

```swift
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 1400
// her blir ikke hd endret

var mode = VideMode(name: "Kul modues")
sameMode = mode
sameMode.name = "En annen modus"
// Både mode og sameMode sitt name er En annen modus
```

---

# Access Control

* _Access Control på klasser, structs, metoder, properties, etc._

```swift
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}
```

^ Ligner veldig på for eksempel Java

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
            println("I ferd med å sette totalSteps til \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                println("La til \(totalSteps - oldValue) steg")
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
class SomeClass {
    class func someTypeMethod() {

    }
}

struct SomeStruct {
    static func someTypeMethod() {

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

* _Bruk final hvis du ikke ønsker at man skal kunne bruke override ved arv_

---

```swift
class Train: Vehicle {
    override func makeNoise() {
        println("Wrom wrom")
    }

    var gear = 1
    override var description: String {
        return super.description + " er i gir \(gear)"
    }

    override var currentSpeed: Double {
      didSet {
          gear = Int(currentSpeed / 10.0) + 1
      }
  	}

		final var color: UIColor;
}
```

---

# Når bruke struct

* _Når du skal enkapsulere enkle dataverdier_
* _Når verdiene bør bli kopiert og ikke referert til_
* _Når alle properties i structuren er value types_
* _Når man ikke trenger arv fra andre typer_

Eksempel: _String, Array og Dictionary er structs_

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

* Gir compile error om man ikke har sjekker for nil først_

---
```swift
var optionalString: String? = "Hello"
optionalString == nil // false

optionalString! //unwrapping

// Automatisk unwrapping og sette verdien i en if
if let s = optionalString {
    println(s)
}
```

---

# Optional chaining

```swift
if let street = hansm.residence?.address?.street {
    println("Hans Magnus bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
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

* _Mye av Swift sitt standard bibliotek er bygd med generics kode_
* _For eksempel er Array og Dicionary typene generic collections_

---

```swift
func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
```

---

# Playground

* _Ligner på Scala Workspaces or F# interactive mode_
* _Kjører kode forløpende_
* _Tidslinje som skriver ut alt som skjer i en prosess_
* _Eksempelvis loops, komposisjon av views eller animert SpriteKit scene_

^ Ny algoritme, nye tester, utforske apier, rette en bestemt bug

---

# Playground Demo

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

---

# [fit] Spørsmål _**[?]**_

---

# [fit] Gira?
# [fit] Stikk å programer Swift
# [fit] _**Lykke til!**_
