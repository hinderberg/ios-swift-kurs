# Øvingsoppgaver forelesning 5

---

# Oppgave 1

Implementer en App som har følgende funksjonalitet for både iPad og iPhone
* Du må ta utgangspunkt i Single View Application templatet

Applikasjonen er en TODO applikasjon og brukerne skal kunne bruke den på både iPhone og iPad

1. En bruker skal bli presentert med en liste av TODOS når han starter applikasjonen
2. På iPad skal brukeren ha listen til venstre og detalj for en valgt todo til høyre
3. På iPhone skal brukeren ha en liste og når brukeren trykker på et element i listen skal brukeren se detaljene for den valgte TODOen
4. Brukeren skal ha mulighet til å legge til TODO fra første visning på alle flater
5. Brukeren skal kunne fullføre en oppgave og da skal oppgaven blir borte fra listen på første side

HINT: Her kan man bruke UISplitViewController, UINavigationViewController, UITableViewController og Delegate pattern

# Oppgave 2

1. Fortsett på oppgave 1 og lag et annet view som også viser alle TODOS, men i en grid
2. Lag deretter en knapp for å toggle mellom listen som du lagde i oppgave 1 og grid'et

HINT: Ta i bruk UICollectionViewController

# Oppgave 3

Lek med Unified Storyboard, Size classes og Auto Layout for å støtte alle potensielle størrelser i appen din
