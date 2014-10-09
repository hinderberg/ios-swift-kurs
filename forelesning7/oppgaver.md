# Øvingsoppgaver forelesning 7

---

## Oppgave 1

Lag en prosjekt og legg inn følgende tester.
Få testene til å gå grønn uten å modifisere verdiene i testen:

```swift
import UIKit
import XCTest

class FizzBuzzTests: XCTestCase {
    var fizzbuzz: FizzBuzz?

    override func setUp() {
        super.setUp()

        self.fizzbuzz = FizzBuzz()
    }

    func testCheck_returnsFizzBuzz() {
        let string = self.fizzbuzz?.check(15)
        XCTAssertEqual(string!, "FizzBuzz!")
    }

    func testCheck_returnsFizz() {
        XCTAssertEqual(self.fizzbuzz?.check(9), "Fizz!")
    }

    func testCheck_returnsBuzz() {
        XCTAssertEqual(self.fizzbuzz?.check(10), "Buzz!")
    }

    func testCheck_returnsNumber() {
        XCTAssertEqual(self.fizzbuzz?.check(11), "11")
    }
}
```

HINT: Klassen du lager vil ikke automatisk bli tilgjengelig i Test target.
Trykk på klassen du har laget og sett target membership til test target i tillegg til applikasjons target

## Oppgave 2

Lag en assertion som feiler om man kaller en metode med feil parametre.
Kjør prosjektet og valider at Xcode stopper applikasjonen der du spesifiserte asserten

## Oppgave 3

Lag et Cocoa Touch Rammeverk og bruk det i to forskjellige prosjekter

TIPS: Gjenbruk en av prosjektene vi har laget i foregående øvinger

## Oppgave 4

Legg til disse filene i Cocoa Touch Rammeverket som du har laget i prosjektet ditt

Se [Filer](MessangerFiles.zip)

## Oppgave 5


### Twitter aktig app
Vi skal lage en twitter aktig app ved å snakke med en server.
Fullfør rammeverket fra oppgave 4 og sørg for å kunne utføre alle handlingene API'et tilbyr.

### Server
Serveren ligger på http://mobile-course.herokuapp.com/

Rest endepunktene leverer JSON og fungerer på følgende måte:

<table class="table table-bordered">
	<thead>
		<tr>
			<th>URL</th>
			<th>HTTP verb</th>
			<th>Beskrivelse</th>
		</tr>
	</thead>
	<tbody>
	<tr>
		<td><a href="http://mobile-course.herokuapp.com/message">http://mobile-course.herokuapp.com/message</a></td>
		<td>GET</td>
		<td>Henter alle beskjeder</td>
	</tr>
	<tr>
		<td><a href="http://mobile-course.herokuapp.com/message">http://mobile-course.herokuapp.com/message</a></td>
		<td>POST</td>
		<td>Oppretter beskjed (se eksempel på JSON i body under)</td>
	</tr>
	<tr>
		<td><a href="http://mobile-course.herokuapp.com/message/:id">http://mobile-course.herokuapp.com/message/:id</a></td>
		<td>PUT</td>
		<td>Oppdaterer en beskjed med angitt id</td>
	</tr>
	<tr>
		<td><a href="http://mobile-course.herokuapp.com/message/:id">http://mobile-course.herokuapp.com/message/:id</a></td>
		<td>DELETE</td>
		<td>Sletter en beskjed med angitt id</td>
	</tr>
	</tbody>
</table>

HINT: Bruk UITableView og UITextField for å liste ut og legge til beskjeder
