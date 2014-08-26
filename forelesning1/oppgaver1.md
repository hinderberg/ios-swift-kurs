# Øvingsoppgave forelesning 1

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