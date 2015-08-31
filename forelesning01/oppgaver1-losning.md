# Løsningsforslag


## Oppgave 11

```
#!/usr/bin/env xcrun swift
import Cocoa

let data = NSFileHandle.fileHandleWithStandardInput().availableData

let input = NSString(data: data, encoding: NSASCIIStringEncoding)
let sorted = input?.componentsSeparatedByString("\n").sort({ (s1, s2) -> Bool in
    return s2 < s1
})

print(sorted!.joinWithSeparator(","))

```