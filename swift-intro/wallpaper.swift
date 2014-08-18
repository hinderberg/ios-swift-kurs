#!/usr/bin/env xcrun swift

import Cocoa
import Appkit

var arguments = Process.arguments;
arguments.removeAtIndex(0)

if arguments.count != 1 {
    println("Usage: ./wallpaper.swift -- [wallpaper path]")
    exit(1)
}

let path = arguments[0]
println("Finding wallpaper at path: " + path)

var workspace = NSWorkspace.sharedWorkspace()
var screen = NSScreen.mainScreen()

var imgurl : NSURL = NSURL.fileURLWithPath(path)
var error : NSError?
var result : Bool = workspace.setDesktopImageURL(imgurl, forScreen: screen, options: nil, error: &error)
 
if result {
    println("Wallpaper set!")
} else {
    println("Failed setting wallpaper")
}