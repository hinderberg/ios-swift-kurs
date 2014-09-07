# Øvingsoppgaver forelesning 3

Oppgavene løses som tidligere i playground.

## Oppgave 1

Bruk matrise klassen under og lag subscript for å hente ut og sette verdier i matrisen

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

```

## Oppgave 2

1. Lag klassene som er nødvendig for at denne if statementen fungerer
2. Lag instansene som utløser de to forskjellige muligetene i if statmenten

```swift
if let street = westerdals.students.first?.address?.street {
    println("Studenten bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
}
```

## Oppgave 3

1. Lag en metode på address og kall den i stedet for street i if statementen

```swift
if westerdals.students.first?.address?.printStreet() {
    println("Det gikk bra å kalle print funksjonen")
} else {
    println("Jeg kunne ikke kalle metoden")
}
```

## Oppgave 4

1. Lag en metode som returnerer en optional på address

```swift
if let fullStreetName = westerdals.students.first?.address?.buildFullStreetName() {
    println("Fullstendig gatenavn er \(fullStreetName)")
} else {
    println("Kunne ikke hente fullstendig gatenavn")
}
```

## Oppgave 5

1. Lag en bytt ut first? med subscript kall for å hente ut student nummer 2

```swift
if let street = westerdals.students.first?.address?.printStreet {
    println("Det gikk bra å kalle print funksjonen")
} else {
    println("Jeg kunne ikke kalle metoden")
}
```
