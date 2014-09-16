# [fit]PG5600
# [fit]iOS programmering
## Forelesning 4

---

# Agenda

* Komponentene i en iOS app
* Launch flow
* Application lifecycle
* MVC
* View og view controllers

---

# Sentral dokumentasjon:

* Apple docs (XCode -> Help -> Documentation and API reference): 
    * App Programming Guide for iOS
        * The App Life Cycle
    * View Programming Guide for iOS
    * View Controller Programming Guide for iOS

---

# Komponentene i en iOS app

---

# Oversikt

![inline](img/structure-apps.png)

---

# UIApplication

* Hver app har nøyaktig en (singleton), som blir opprettet av UIApplicationMain
* Aksesseres med `UIApplication.sharedApplication()`
* Håndterer eventloop og høynivå funksjonalitet
* Informerer om state transitions og eventer via app delegate, som er stedet du har mulighet
til å håndere disse

---

# App delegate

* Går hånd i hånd med UIApplication, og er stedet hvor du håndterer app events
* App initialisering (eks, views, initielle data)
* Håndterer state transitions
* Håndterer høynivå app events (eks. push-notifications)

---

# UIWindow

* Som regel bare ett, med mindre man har innhold på flere skjermer
* Manipuleres ikke direkte. I stedet bruker man View Controllers, som igjen
oppdaterer viewene som vises i UIWindow

---

# View Controllers

Håndterer et view og dens subview, koordinerer eventer og kommunikasjon mellom modeller og views

![inline](img/view-controllers.png)

---

# View Controllers

![inline](img/view-controllers2.png)

---

# Views

* Tegner innhold på skjermen
* Reagerer på events
* UIKit inneholder standardviews (labels, text fields, tables, etc.)
* Kan subklasse UIView for å lage custom views

---

# Launch flow

---

# Launch flowchart (old school)

![inline](img/launch-flowchart.png)

[CC-BY Ole Begemann](http://oleb.net/blog/2012/02/app-launch-sequence-ios-revisited/)

---

# Launch (old school #1)

```objc
// main.m
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 1. Oppretter UIApplication singleton og AppDelegate
        // 2. application:didFinishLaunchingWithOptions: i delegate blir senere 
        // kalt av UIApplication
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
```

---

# Launch (old school #2)

```swift
// AppDelegate
func application(application: UIApplication, 
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    // bruker .xib til å sette opp GUI (også old school)
    // mer om oppsett av view senere
    let vc = DemoViewController(nibName: "DemoViewController", bundle: nil)
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
    
    return true
}


```

---

# Launch (new school)

```swift
// @UIApplicationMain kaller UIApplicationMain() og bruker denne
// klassen som appdelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, 
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Gjør automatisk:
        // - Oppretting av UIWindow
        // - Laster main storyboard
        // - Setter initiell VC fra storyboard på UIWindow
        // - Viser vinduet 
        return true
    }
}

```

Mer info [1](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Attributes.html) og [2](http://oleb.net/blog/2012/02/app-launch-sequence-ios-revisited/)

---

# Application lifecycle

---

![left](img/states.png)

* __Inactive__: i forgrunnen, men mottar ikke eventer (eks. ved inkommende anrop)
* __Active__: normalstate. I forgrunn og mottar eventer
* __Background__: Mulighet for å kjøre enkelte operasjoner i bakgrunnen (eks. lyd) / Ved launch inn i background (eks. background fetch, push)
* __Suspended__: I minnet, men kjører ingen kode

---

![left](img/launch-fg.png)

* Det er forventet at apper starter på maks 5 sekunder, i motsatt fall kan appen bli terminated.

---

![left](img/launch-bg.png)

* Maks 5 sekunder til å kjøre kode før suspended
* Kan be om mer tid for enkelte oppgaver med `beginBackgroundTaskWithExpirationHandler:` 

---

# MVC

---

# MVC

* Views: knapper, tekstfelt og andre komponenter synlige for brukeren
* Models: holder på data. Eks. arrays, dictionaries. Har ingen kjennskap til views
* Controllere: 
    * kan motta hendelser fra views
    * kan oppdatere modeller
    * kan oppdatere views med modelldata

---

# MVC

![inline](img/mvc.png)

Bilde: The Big Nerd Ranch Guide, kap. 1

---

# View Controllers (VC)

---

# View Controllers

![inline](img/view-controllers2.png)

---

# View Controllers

* __Du setter aldri views direkte på UIWindow selv.__ I stedet setter man en view controller på UIWindow, som igjen vil legge sine views til vinduet
* View controllere og ressursstyring:
    * Laster bare inn viewet sitt når det trengs
    * Kan deallokere viewet, f.eks. ved lite minne

---

# View Controllers

* View Controllere vil typisk bare kjenne til en del av applikasjonen, og vil derfor kommunisere med andre view controllere
* Views sender meldinger til sin VC. Eksempelvis når du trykker på en UIButton kan det sende en melding til sin VC, som definerer hva som skal skje

---

# View Controllers

* Content view controllers: "vanlige" view controllere du definerer for å vise/hente data fra bruker
* Container view controllers: inneholder andre view controllere, eks. UINavigationController, UISplitViewController

---

# Navigation Controller

![inline](img/view-controllers.png)

---

# Split View Controller

![inline](img/split-vc.png)

---

# Nøstede view controllere

![inline](img/nested-vc.png)

---

# Innlasting av views i minnet

![inline](img/view-into-memory.png)

---

# Måter å sette opp views og view controllere på

![left](img/appwindow.png)

* Via kode
* XIB (old school)
* Storyboards

---

# Via kode - eksempel

```swift
func application(application: UIApplication, 
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.rootViewController = CustomViewController()
    window?.makeKeyAndVisible()
    
    return true
}
```

---

# Via kode - eksempel

```swift
class CustomViewController: UIViewController {

    // 1. override loadView
    override func loadView() {
        // 2. alloker et view. Størrelsen blir justert av parent
        view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        view.backgroundColor = .blackColor()
        
        // 3. opprett subviews
        let button = UIButton(frame: CGRectMake(0, 100, view.frame.width, 50))
        button.setTitle("Hello world", forState: .Normal)
        button.addTarget(self, action: "sayHello", forControlEvents: UIControlEvents.TouchUpInside)
        
        // 4. legg til subviews
        view.addSubview(button)
    }
    
    func sayHello() {
        println("Hello world")
    }
}
```

---

# XIB eksempel

![inline](img/xib1.png)

---

# XIB eksempel

![inline](img/xib2.png)

---

# XIB eksempel

![inline](img/xib3.png)

---

# XIB eksempel

![inline](img/xib4.png)

---

# Koble view og view controllere sammen

* Outlets
* Targets

---

# XIB eksempel

```swift
func application(application: UIApplication, 
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.rootViewController = CustomViewController(nibName: 
        "CustomViewController", bundle: nil)
    window?.makeKeyAndVisible()
    
    return true
}
```

---

# nibName? Var det ikke en XIB?

XIB (uttales sib) og storyboards kompileres til NIB:

> The contents of .xib and .storyboard files are stored by Xcode in XML format. At build time, Xcode compiles your .xib and .storyboard files into binary files known as nibs. At runtime, nibs are loaded and instantiated to create new views.
- Apple Docs

---

# Storyboards

![](img/storyboard.png)

---

# Storyboards

* Standardmåten å lage views på
* Kan gi deg et overblikk over flyten i applikasjonen
* Muliggjør drag'n'drop for å koble view controllere sammen (kalt segues - på norsk: naturlig overgang)
* View controllere instansieres automatisk med verdiene fra interface builder når de trengs

---

# Segue ≠ segway
## Men uttales mistenkelig likt...

![](img/segway.jpg)

---

# Storyboard eksempel

1. Åpne `Main.storyboard` og opprett GUI på samme måte som med XIB
2. Oppdater `application:didFinishLaunchingWithOptions:` til

```swift
func application(application: UIApplication, 
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    return true
}
```

---

# Storyboard eksempel

3 - Sett Main interface i prosjektet:

![inline](img/storyboard-main.png)

---

# Lage flere view controllere

---

# Lage flere view controllere i storyboard

1 - Dra og slipp "View Controller" inn i storyboard fra Object Library:
![100%](img/ib-vc.png)

2 - File -> New -> File -> Cocoa Touch, subclass of UIViewController

---

# Lage flere view controllere i storyboard

3 - Koble view controller objektet i storyboard sammen med sin faktiske klasse (fra steg 2)

![inline](img/ib-set-class.png)


---

# Kommunikasjon mellom view controllere

---

# Kommunisere mellom VC

![inline](img/vc-communication.png)

---

# Kommunisere mellom VC

* Destination controller: eksponerer properties for data/presentasjon
* Source: setter properties på destination controller før den blir vist
* Når destination controller har behov for å kommunisere tilbake, gjøres dette via en delegate som sourcen oppgir. Destination controller har dermed ikke direkte kjennskap til sine foreldre

---

# Kommunisere mellom VC

![inline](img/vc-communication2.png)

---

# Kommunisere mellom VC

![inline](img/vc-communication3.png)

---

# Kommunisere mellom VC

![inline](img/vc-communication4.png)

---

# Kommunisere mellom VC (alt 1)

```swift
import UIKit

class ViewController: UIViewController {

    // Referanse til inputfeltet
    @IBOutlet weak var message: UITextField!
    
    // Kalles når man trykker på "Send melding"
    @IBAction func sendMessage(sender: AnyObject) {

        // Instansierer ny vc fra storyboard MANUELT for å vise hvordan
        // Normalt lar vi storyboard gjøre dette for oss. Se alt 2. senere.
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("receivingVC") 
            as? ReceivingViewController {
            // Setter property på destination vc
            vc.message = message.text
            // Før den vises
            presentViewController(vc, animated: false, completion: nil)
        }
        
    }

}
```

---

# Kommunisere mellom VC (alt 1)

Connections inspector skal se slik ut:

![inline](img/vc-communication5.png)

---

# Kommunisere mellom VC (alt 1)

```swift

// Den andre view controlleren
class ReceivingViewController: UIViewController {

    // Denne må settes av parent view controller
    var message: String?
    
    @IBOutlet weak private var messageLabel: UILabel!
    
    // Konfigurerer viewet, etter at det er lastet inn i minnet
    // Funker både for views som lastes fra nib (storyboard/xib)
    // og for de laget med ren kode (loadView:)
    override func viewDidLoad() {
        super.viewDidLoad()

        messageLabel.text = message
    }

}
```

---

# Kommunisere mellom VC (alt 1)

Connections inspector skal se slik ut:

![inline](img/vc-communication6.png)

---

# Yay!
## Men det finnes en enkelere måte?

---

# Storyboard og segues

Kan lage connections mellom view controllere med drag'n'drop i storyboard. Disse overgangene kalles segues.

![inline](img/vc-segue.png)


---

# Kommunisere mellom VC (alt 2)

```swift
// Kun denne view controlleren oppdateres. ReceivingViewController
// er uendret
class ViewController: UIViewController {

    @IBOutlet weak var message: UITextField!
    
    // Kalles før overgangen skjer
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if let vc = segue.destinationViewController as? ReceivingViewController {
            vc.message = message.text
        }

    }
}
```

---

# [fit]Oppgaver

##[fit] Se [Øvingsoppgavene](oppgaver4.md)

##[fit] https://github.com/hinderberg/ios-swift-kurs
