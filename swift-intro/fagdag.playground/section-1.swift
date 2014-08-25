import UIKit

func printSequence<T: SequenceType>(sequence: T) {
    for part in sequence {
        println(part)
    }
}

printSequence("ABCDEF")
printSequence(["Aa", "Bb"])
printSequence(["A": "B", "B": "A"])


// UIView
let frame = CGRectMake(0, 0, 250, 250)
var view = UIView(frame: frame)
view.backgroundColor = UIColor.blackColor()
var label = UILabel(frame: CGRectMake(10, 10, 100, 100))
label.text = "Hei BEKK";
label.textColor = UIColor.whiteColor();
view.addSubview(label)