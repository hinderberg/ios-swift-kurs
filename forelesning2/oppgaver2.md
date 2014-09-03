# Øvingsoppgaver forelesning 2

Tips: en del av Swift er fortsatt dårlig dokumentert. [Denne listen](http://practicalswift.com/2014/06/14/the-swift-standard-library-list-of-built-in-functions/) med funksjoner på toppnivå kan være til hjelp i oppgaveløsningen

## Oppgave 1
Denne funksjonen finnes ikke, så den må lages. Output skal være "WWWWW"

	repeatCharacter(Character("W"), 5)

## Oppgave 2
Lag en ny funksjon som bruker eksternt parameternavn for å tydeligegjøre hensikten med funksjonen

	repeatCharacter(Character("W"), times: 5)

## Oppgave 3
Utvid funksjonen til å støtte default parametere. Dvs. at når times ikke oppgis, så skal den som standard settes til 1. Output her blir altså "W"

	repeatCharacter(Character("W"))

## Oppgave 4
Lag en funksjon som kan ta inn et variabelt antall parametere, og sum regner ut produktet av disse:

	calculate(2, 5, 5) // --> 50
	calculate(10, 10) // --> 100

## Oppgave 5
Utvid funksjonen slik at den støtter utregning av både produkt og sum (med enum som første parameter):

	calculate(.Product, 2, 5, 5) // -> 50
	calculate(.Product, 10, 10) // -> 100
	calculate(.Sum, 2, 5, 5) // -> 12
	calculate(.Sum, 10, 10) // -> 20

## Oppgave 6
Endre funksjonen slik at den bruker multiple return, og alltid regner ut både produkt og sum:

	let result = calculate(2, 5, 5)
	println("Produkt: \(result.product), Sum: \(result.sum)")

## Oppgave 7
Lag en funksjon getCalculator, som tar imot en operator. Dersom operatoren er gyldig (er + eller *) skal riktig regnefunksjon returneres, som igjen kan kalles for å utføre selve regneoperasjonen. Hvis operatoren ikke er støttet (altså ikke er + eller *) skal nil returneres.

	// Skal kunne regne ut produkt ved å bytte ut + med *:
	if let calcFn = getCalculator("+") {
	    println(calcFn([3, 6, 9]))
	}

# Oppgave 8
Lag en request-metode som tar inn en string som første
parameter, og en closure som 2. parameter:

	request("http://www.vg.no", { beskrivelse in
	    if beskrivelse {
	        println(beskrivelse)
	    } else {
	        println("Fant ikke noen beskrivelse")
	    }
	})

Når URLen er `http://www.vg.no` som i eksemplet, skal
beskrivelsen være "Verdens gang". Dersom URLen er `http://www.aftenposten.no` skal beskrivelsen være "Aftenposten". I andre tilfeller er beskrivelsen `nil` og `Fant ikke noen beskrivelse` skal skrives ut

# Oppgave 9

Fullfør dette programmet:

	// 1. Lag en struct `Coordinate` som inneholder lat/long her

	/* 2. Lag en klasse `GeoCache` som har properties for:
	- Coordinate
	- name
	- hint
	- log (en array med strenger) 

	Lag en `signLog` metode som legger igjen en beskjed i cacheloggen
	*/
	
	let cache = /* instansier og populer GeoCache, eks:
	lat: 59.91126
	long: 10.76046
	name: Westerdals
	hint: Rom 81
	*/

	cache.signLog("Someone was here...")
	cache.signLog("I was here!")
	println(cache.description)

Slik at det ender med å skrive ut:

	Westerdals
	59.0 42.0
	Hint: Rom 81

	Logg:
	Someone was here...
	I was here!