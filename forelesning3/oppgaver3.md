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

1. Implementer en base klasse som kalles Shape med høyde og bredde properties
1.1 Ta stilling til om de bør vœre variabler eller konstanter
1.2 Lag en kontruktør til denne baseklassen
2. Lag en subclass som arver fra base klassen Shape
