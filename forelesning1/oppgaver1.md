# Øvingsoppgave forelesning 1

## Oppgave 1

Definer en konstant med “Swift er fett!”.
- Forsøk å sette verdien til noe annet.
- Hvorfor fikk du feilmelding nå?
- Endre koden slik at du kan endre verdien uten å få feilmelding



```swift
// Skriv inn kode her
```

## Oppgave 2

Lag en konstant med en eksplisitt String type og verdien “iOS FTW” - Fjern deretter typen. Hvorfor er dette mulig?

```swift
// Skriv inn kode her
```

## Oppgave 3

Lag en numerisk konstant og en streng konstant, lag deretter en konstant som innholder begge.
Gjennomfør dette både med string interpolering og uten.

```swift
// Skriv inn kode her
```

## Oppgave 4

Lag et utrykk med string interpolering der du regner ut summen av 5 * 120 som en del av interpoleringen, skriv dette ut ved hjelp av println

```swift
// Skriv inn kode her
```

## Oppgave 5

Sammenlign to strenger og print “de er like”, om de er helt like, eller “de er forskjellige” om de er ulike

```swift
// Skriv inn kode her
```

## Oppgave 6

Lag en touple med innholdet (5600, “iOS programmering”). Bruk deretter println for å skrive ut “PG5600 - iOS programmering”

```swift
// Skriv inn kode her
```

## Oppgave 7

Lag en loop der du skriver ut hver ord i en array på egen linje
Lag deretter en loop som printer ut hver enkelt bokstav i hvert ord på en ny linje

```swift
// Skriv inn kode her
```

Forventet resultat:

	Abba
	A
	b
	b
	a
	Dabba
	D
	a
	b
	b
	a
	Du
	D
	u

## Oppgave 8

Lag en dictionary med 5 key-value par, loop over den og skriv ut key og value med println

```swift
// Skriv inn kode her
```

## Oppgave 9

Lag et nytt iOS prosjekt i Xcode av typen “Single View Application”.
1. Finn det stedet som kalles når applikasjonen starter opp
2. Definer opp streng konstanter for title, beskjed og knapp.
3. Lag et UIAlertView objekt som bruker konstantene du har definert.
4. Kall en metode .show på alert view instansen.
5. Kjør simulatoren og verifiser at tekststrengen dukker opp.



```swift
// Skriv inn kode her
```

## Oppgave 10
```swift
let words = ["apple", "organges", "banana"]
// Sett inn kode her
```

Som skriver ut

	apple
	    l
	    p
	    p
	    a
	organges
	       e
	       g
	       n
	       a
	       g
	       r
	       o
	banana
	     n
	     a
	     n
	     a
	     b

## Oppgave 11

Denne oppgaven er ekstra utfordrende og må løses utenfor playground. I terminalen, kjør først:

	xcode-select -s /Applications/Xcode6-Beta6.app/Contents/Developerents/Developer

Slik at du kan kjøre swift fra kommandolinjen.

Lag deretter en fil “langauges.txt” med innholdet:

	Swift
	Java
	Objective-C
	Python

Lag deretter en fil kalt “swiftsort” med følgede innhold:

	#!/usr/bin/env xcrun swift
	import Cocoa
	println(“Hello world”)

For å gjøre denne kjørbar fra terminalen, skriver du

	chmod +x swiftsort

Prøv å kjøre applikasjonen med

	./swiftsort

Du skal nå se "Hello world" i terminalen. Oppgaven videre er å oppdatere swiftsort slik at

	cat languages.txt|./swiftsort

Vil skrive ut:

	Java, Objective-C, Python, Swift
