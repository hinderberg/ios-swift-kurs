# Øvingsoppgaver forelesning 3

Oppgavene løses som tidligere i playground.

## Oppgave 1

Bruk matrise stuct'en under og lag et subscript for å
hente ut og sette verdier i matrisen.
Verdien du skal hente ut og sette er en Double.

```swift

struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[1,1] = 2.0
matrix[1,1] // prints 2.0

```

## Oppgave 2

1. Svar på hvorfor kompilatoren feiler når du limer inn klassen uten kontruktør?
2. Lag en designated konstruktør og en convenience kontruktør for denne klassen
3. Lag nye instanser av klassen ved hjelp av de to kontruktørene du lagde i oppgave 2.2

```swift
class Time {
    var hour: Int
    var minute: Int
    var second: Int

    var running: Bool = false
    var startedAt: NSDate?
    var stoppedAt: NSDate?
}
```

## Oppgave 3

1. Lag en base klasse Animal, der du finner måter å final og required som beskrevet i slidene
2. Lag en metode for å sove, en metode for å lage en lyd med println og en metode for å spise
3. Lag deretter en subclass, for eksempel Bird som arver av base klassen Animal
4. Bruker override for å skrive over base klassen funksjonaliteten
5. Lag en subclass til som arver av Animal base klassen
6. Lag en array med begge subklassene og foreach over dem,
   identifiser hva slags type det er og skriv det ut ved hjelp av println

## Oppgave 4

1. Lag det som er nødvendig for at denne if statementen fungerer
2. Lag et eksempel på begge utfall av if

```swift
if let street = westerdals.students?.first?.address?.street {
    println("Studenten bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
}
```

## Oppgave 5

1. Lag det som er nødvendig for at denne if statementen fungerer

```swift
if westerdals.students?.first?.address?.printStreet() != nil {
    println("Det gikk bra å kalle print funksjonen")
} else {
    println("Jeg kunne ikke kalle metoden")
}
```

## Oppgave 6

1. Lag det som er nødvendig for at denne if statementen fungerer

```swift
if (westerdals.students?.first?.address = otherAddress) != nil {
    println("Du satt en ny addresse")
} else {
    println("Det var ikke mulig å sette en ny addresse")
}
```

## Oppgave 7

1. Lag det som er nødvendig for at denne if statementen fungerer
2. Lag et eksempel på begge utfall av if

```swift
if let fullStreetName = westerdals.students?.first?.address?.buildFullStreetName() {
    println("Fullstendig gatenavn er \(fullStreetName)")
} else {
    println("Kunne ikke hente fullstendig gatenavn")
}
```

## Oppgave 8

1. Bytt ut first? og bruk subscript i stedet

```swift
if let fullStreetName = westerdals.students?.first?.address?.buildFullStreetName() {
    println("Fullstendig gatenavn er \(fullStreetName)")
} else {
    println("Kunne ikke hente fullstendig gatenavn")
}
```

## Oppgave 9

1. Lag extention på String, slik at følgende kode vil fungere

```swift
"AB".length // 2
"AB".reverse() // Skal printe ut BA
"Abba".contains("AbA") // Skal printe ut false
"Abba".contains("Abb") // SKal printe ut true
```

## Oppgave 10

1. Lag en extention på dato som gjør at følgende kode kjører

```swift
NSDate().daysBetweenDate(NSDate(timeIntervalSinceNow: 3.15569e10)) // 365,241.898148148
```

## Oppgave 11

1. Lag en extention 
