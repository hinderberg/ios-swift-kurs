
# [fit] Velkommen
### Introduksjon til _Swift_

---

### Hans Magnus Inderberg
#### SpareBank 1 Mobilbank
#### Fagleder Mobil
#### _@hinderberg_

---

![](wwdc.png)

^ * WWDC i starten av Juni,
* Uventet
* Nytt programmeringsspråk kalt .....

---

![](swift-logo-hero.jpg)

^ Swift.

---

## Som førte til reaksjoner som dette

![fit inline](tweet-trash.png)

^ * En som kaster Objective-C boken sin.

---

## og dette

![100% inline](tweet-mattt.png)

^ * Eller som Matt Thompson
* Alle er nybegynnere samtidig
* Ingen bedre tid enn nå til å starte med iOS og OSX utvikling

---

#### _Som igjen førte til_

## Introduksjon til Swift

---

# Agenda

1. _Hva er swift?_
2. _Hvordan ser det ut?_
2. _Playground_
3. _De har laget en REPL_

---

# Hva er Swift?
* _Et programmeringsspråk for iOS og OSX laget av Apple_
* _De har fjernet C avhengigheten og Swift tar over for Objective-C_
* _Moderne, Enkelhet og sikkert_
* _Fungerer side-om-side med C og Objective-C_
* _Paradigmer som imperativ, OOP og funksjonelt_  

^ * Laget av Apple
* Under utvikling i rundt 4re år
* Fjernet avhengighet for å få mer frihet
* Moderne, Enkelt og sikkert
* Laget en bro til C og Obj-C
* Kjente paradigmer som funksjonelt og OOP
* Hentet inspirasjon fra .NET og F#, List, Javascript

---

# Hvordan ser det ut?

---

```swift
			   println("Hei hei BEKK")
```

^* Dette er et helt program i Swift
* Printer ut Hei hei BEKK på en ny linje

---

# Konstanter og Variabler

```swift



let shortName: String = "BEKK"


var numberOfemployees: Int = 320
numberOfemployees = 500
```

^ * Konstanter deklareres LET
* Variabler med VAR
* Type defineres med kolon også typen
* Konstant kan bare bli satt en gang, men det må ikke skje ved kompilering.
* Oppfordrer til imutabilitet over mutabilitet

---

# Type inference
```swift



let shortName = "BEKK"


var numberOfemployees = 350
numberOfemployees = 500
```


^ * Stort fokus punkt i Swift.
* * Du skjelden trenger å spesifisere typen. Men typen vil fortsatt vœre der.

^ * De analyserer både oppover og nedover i type-treet.
* Analysere output av det du setter variabelen din til for å finne typen.

^ * Verdier vil aldri automatisk skifte type,
* Legge sammen er string og int, så må du eksplisitt konvertere en av dem.

---

# Unicode støtte


```swift



                   let 🌍 = "😩😛😵😘"
```


^Jada, du kan bruke emicons
* Men fokuset her er å la utviklere utvikle i det språket de snakker

---

# String Interpolation

```swift




let n1 = 10, n2 = 8
let mathString = "\(n1) ganger \(n2) er \(n1 * n2)"
//10 ganger 8 er 80
```

^Strenger kan kombineres ved hjelp av streng interpolation.
* Der man også kan skrive matematiske utrykk
* Kalle funksjoner
^ * Bro mellom Objective-C NSString og Swift String, noe som gjør at man kan benytte disse om hverandre.

---

# Collection types

_Det finnes to typer collections i Swift_

<br />

* _Arrays_
* _Dictionaries_


^ * De vanlige typene finnes også i Swift.
* Map i java

---

# Array

```swift
// Deklaring
let jobs = [String]()

// merk ingen spesifisering av type
var jobs = ["Systemutvikler", "Prosjektleder", "Frontend-Utvikler"]

// Uthenting
jobs[0]
```

^ Et array deklareres på veldig standard måte, med to klammer. Uthenting er som vanlig.
Forskjellig fra objective-c er at type inference gjør at disse er typed arrays

---

```swift
// Modifisering

jobs.append("Rådgiver")
jobs += ["Rådgiver", "Backend-Utvikler"]
jobs[0] = "Backend-Utvikler"
jobs[2..<5] = ["Rådgiver", "Backend-Utvikler", "Prosjektleder"]
```

---

# Dicionary

```swift
// Deklaring
let emptyDictionary = [String: Float]()
var jobs = ["Rådgiver" : 35, "Systemutvikler" : 21, "Prosjektleder" : 32]

// Uthenting
jobs["Systemutvikler"]

// Modifisering
people["Rådgiver"] = 45
people["Prosjektleder"] = 81
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

# Ranges

```swift


for nr in 1...10 {
	println("\(nr) ganger 2 er \(nr*2)")
}

for nr in 1..<10 {
	println("\(nr) ganger 2 er \(nr*2)")
}

```

^_1…10 – Går fra 1 til 10. Og er kjent som en closed range._
 _1..<10 – Går fra 1 til 9. Og er kjent som en half-closed range_

---

# Control flow
<br />

* _if_
* _switch_

---

# if

* _Ikke noe nytt, du har kanskje sett at paranteser er valgfritt_

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

_Her har de gått banans_ ;-)

* _Du trenger ikke bruke break etter hver case_
* _Bruk hvilke som helst object i en switch_
* _Hvis du utelater default case må switch'ene matche alle case, hvis ikke blir det_ compile error

---

```swift
switch age {
case 1,2,3,4,5,6,7,8,9,10:
    println("Du er et barn!")
case 80...100:
    println("Du er gammal!")
default:
    println("I mellom en plass?;)")
}
```

---

# Du kan switche på instanser

``` swift
@IBAction func buttonTouched(sender : UIButton) {
	switch sender {
	  case childButton:
	    println("Du er et barn!")
	  case oldisButton:
	    println("Du er gammal!")
	  default:
	    println("I mellom en plass?;)")
	}
}
```

^ Man kan også switche på instanster av forskjellige typer.
* En knapp

---

++++

^ * regulœre utrykk,
* where clause etc

---

# Optionals


^ , mange måter i objective-c, NSNull, null, nil, NULL, -1...etc
* Rammeverk og hva bruker de? Løst med optionals

---

```swift
var possibleWelcomeMessage: String? = "Halloo"

if possibleWelcomeMessage == nil {
	println("Det er ingen streng her!")
} else {
	// unwrapping med !
	let welcomeMessage = possibleWelcomeMessage!
	println(welcomeMessage)
}
```

^Greit å vite at typer som ikke er optional kan ikke vœre nil.
Da får man kompile error

---

```swift
if let welcomeMessage = possibleWelcomeMessage {
		println(welcomeMessage)
}
```

^Automatisk unwrapping og sette verdien i en if

---

# Optional chaining

```swift



if let street = bekk.people.first?.address?.street {
    println("Personen bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
}
```

---

# Funksjoner
<br />

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

# Funksjoner med returverdi

```swift



func buildName(firstName: String, lastName: String) -> String {
	return "\(firstName) \(lastName)"
}

let fullName = buildName("Olga", "Geiresen")
```
---

# Funksjoner med navngitte parametre

```swift


func buildName(
    yourFirstName firstName: String,
    #lastName: String) -> String {
        return "\(firstName) \(lastName)"
}

buildName(yourFirstName: "Olga", lastName: "Geiresen")
```
---

# Funksjoner med tuple/flerereturverdier

_Grupperer flere verdier inn i en verdi. Godt egnet i funksjoner som skal returnere flere verdier - ikke så godt for komplekse datastrukturer._

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

# Funksjoner med n param av samme type

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

# Funksjoner som parametre

```swift
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func printMathResult(mathFunction: (Int, Int) -> Int,
	a: Int, b: Int) {
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



{ (parameters) -> returnType in
    statements
}

```

^ Samme som funksjoner, bare uten navn!

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

```swift
// Closure inn til den innbygde sorteringsfunksjonen

reversed = sorted(names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

---

```swift
// Med type inference




reversed = sorted(names, { s1, s2 in return s1 > s2 } )
```
^ Closures på speed

---

```swift
/* Implisitt retur når man
har en single-expression closure */



reversed = sorted(names, { s1, s2 in s1 > s2 } )
```

---

```swift
// Snarvei for argumentnavn




reversed = sorted(names, { $0 > $1 }
```

---

```swift
/*
Swift’s String type definerer sin spesifikke
implementasjon av > operatoren som en funksjon som
har to paramerte av typen string og returnerer Bool
*/
reversed = sorted(names, >)
```

---

# Klasser og Structs
<br />

* _Klasser = Reference Types_
* _Structs = Value Types_

^ * Value Types blir kopiert når man assigner dem til en ny variabel eller konstant
* Reference types øker bare antall pekere til det samme objektet.

---

```swift
struct Position {
    let latitude: Float
    let longitude: Float
}

class Address {
    let position: Position?
    var street: String?
}
```

^Slipper endelig .h filer, trenger ikke arve av NSObject
Et eksempel på stored properties

---

# Klasser og structures har mye til felles
* _Definere properties_
* _Definere metoder_
* _Definere subscripts (snarveier for å hente verdier)_
* _Definere kontruktører_
* _Kan bli utvided med extentions_
* _Kan implementere protocols_

---

# Klasser kan i tillegg

* _Arv_
* _Type casting - man kan sjekke og tolke typen runtime_
* _`deinitializers` for opprydding når instansen blir kastet_
* _Referanse telling - mer enn en referanse til en klasseinstans_

---

# Eksempel

```swift


let positionX = Position(latitude: 59.903933, longitude: 10.739286)
var positionY = positionX
positionY.latitude = 60.233333
// her blir ikke positionX endret

var address = Address(street: "Akershusstranda 21")
var address2 = address
address2.street = "Sluppenveien 17A"
// Både address og address2 sin addresse blir endret
```

^Legg merke til at man slipper alloc og eller new
Man har også konstruktører og de heter init

---

# Når bruke struct

* _Når du skal enkapsulere enkle dataverdier_
* _Når verdiene bør bli kopiert og ikke referert til_
* _Når alle properties i structuren er value types_
* _Når man ikke trenger arv fra andre typer_

Eksempel: _String, Array og Dictionary er structs_

---

# Access Control

_Access Control på blant annet:
klasser, structs, metoder og properties._

```swift


public class Address {}
internal class Address {}
private class Address {}
```

^ Ligner veldig på for eksempel Java

---

# Kalkulerte properties

```swift
class Employee {
    var address: Address?
    var salary: Double = 100000
    var bonusPercent = 0.20

    var bonus: Double {
        get {
            return self.salary * bonusPercent;
        }
        set(newBonus) { // må ikke ta inn noe, da kan man bruke newValue i stedet
            self.bonusPercent = newBonus
        }
    }
}
```

---

# READ-only

```swift
class Employee {
		var address: Address?
		var salary: Double = 100000
		var bonusPercent = 0.20

		var bonus: Double {
			return self.salary * bonusPercent;
		}
}
```

---

# Obseravble properties

```swift
class Employee {
    var address: Address?
    var salary: Double = 100000
    var bonusPercent = 0.20
    var invoicing: Double = 100.00 {
        willSet(newInvoicing) {
            println("I ferd med å ny faktueringsgrad \(newInvoicing)")
        }
        didSet {
            if invoicing > oldValue  {
                println("Bedret faktueringsgrad med \(invoicing - oldValue) steg")
            }
        }
    }
    var bonus: Double {
        get {
            return self.salary * bonusPercent;
        }
        set(newBonus) { // må ikke ta inn noe, da kan man bruke newValue i stedet
            self.bonusPercent = newBonus
        }
    }
}
```

---

```swift
var invoicing: Double = 100.00 {
	willSet(newInvoicing) {
		println("I ferd med å ny faktueringsgrad \(newInvoicing)")
	}
	didSet {
		if invoicing > oldValue  {
			println("Bedret faktueringsgrad med \(invoicing - oldValue) steg")
		}
	}
}
```

---

# Metoder sier du?
<br /><br /><br />


_Fungerer likt som funksjoner_

---

# Klassemetoder

```swift
class Address {
    class func someMethod() {

    }
}

struct Position {
    static func someMethod() {

    }
}
```

---

# Arv

---

```swift
class Employee: Human {
    var firm = "Bekk Consulting"

    override func scream() {
        println("Waaaaaaaaaaa")
    }

    override var description: String {
        return super.description + " er ansatt i \(firm)"
    }

    override var confidence: Double {
      didSet {
          confidence = confidence * 200
      }
  	}
}
```

^Bruk final hvis du ikke ønsker at man skal kunne bruke override ved arv_

---

# Enums

```swift
enum Level {
	case Consultant
	case Senior
	case Manager
}

// eller
enum Level {
	case Consultant, Senior, Manager
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

^Kan ha konstruktører, funksjoner, variabler

---

# Protocols

* _Ganske likt Objective-C, brukes fortsatt til delegate pattern_
* _Samme som interface i Java og andre språk_
* _Definerer opp et sett med metoder, properties, klasse metoder, operatorer og subscripts som passer en bestemt funksjonalitet_
* _Inneholder ingen implementasjonskode_

---

```swift
protocol Firm {
	var mustBeSettable: Int { get set }
	var doesNotNeedToBeSettable: Int { get }


	class func someTypeMethod()
	func random() -> Double
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
* _Gir mulighet å implementere en protocol for en eksiterende type_

---

```swift
extension String {
	var uppercase: String { return self.uppercaseString }
}

var name = "Hans Magnus"
name.uppercase // "HANS MAGNUS"

```

---

# Generics

* _Mye av Swift sitt standard bibliotek er bygd med generics kode_
* _For eksempel er Array og Dicionary typene generic collections_

---

```swift
func printSequence<T: SequenceType>(sequence: T) {
    for part in sequence {
        println(part)
    }
}

printSequence("ABCDEF")
printSequence(["Aa", "Bb"])
printSequence(["A": "B", "B": "A"])
```

---

# Playground

* _Ligner på Scala Workspaces og F# interactive mode_
* _Kjører kode forløpende_
* _Test ut nye algoritme, tester, utforsk apier, rett en bestemt bug_

---

# Playground Demo

---

# REPL

###### _Apple har laget read–eval–print loop_
###### _Tilgjengelig både når man debugger og i terminalen_
###### _Startes med ```xcrun swift``` i terminalen_

---

# For å kjøre Swift i terminalen
## må man sette nyeste xcode med
## _`xcode-select`_

_xcode-select -s /Applications/Xcode6-Beta6.app/Contents/Developerents/Developer_

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
println("Finding wallpaper at path: \(path)")

let workspace = NSWorkspace.sharedWorkspace()
let screen = NSScreen.mainScreen()

let potensialImgUrl : NSURL? = NSURL.fileURLWithPath(path)
var error : NSError?

if let imageUrl = potensialImgUrl {
    let result : Bool = workspace.setDesktopImageURL(imageUrl, forScreen: screen, options: nil, error: &error)

    if result {
        println("Wallpaper set!")
    } else {
        println("Failed setting wallpaper")
    }
} else {
    println("There is something wrong with the path: \(path)")
}
```

---

# Swift er ikke ferdig

^Ikke stabilt før om omtrent 2 år
* Kan brukes i dag
* Xcode embedder en liten runtime i appen
* Så runtimen vil ikke ligge på iOS før om noen år

---

# [fit] Spørsmål _**[?]**_

---

# [fit] Gira?
# [fit] _**Lykke til!**_
##### _https://developer.apple.com/swift/_

---

# One more thing
### _github.com/hinderberg/ios-swift-kurs_
