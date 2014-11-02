# Løsningsforslag

## Oppgave 10

	import Cocoa

	let words = ["apple", "organges", "banana"]
	for word in words {
	    var arr = Array(word)
	    arr.removeLast()
	    
	    let indent:String = join("", arr.map({(w) -> String in
	        return " "
	        }))

	    println(word)
	    
	    for character in arr.reverse() {
	        println("\(indent)\(character)")
	    }
	}

## Oppgave 11

	#!/usr/bin/env xcrun swift
	import Cocoa

	let input:String = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData,
		encoding:NSUTF8StringEncoding)
		
	let s = sorted(input.componentsSeparatedByString("\n"), {(s1: String, s2: String) -> Bool in
	        return s2 > s1
	})

	println(join(",", s))