import UIKit

// UIView
let frame = CGRectMake(0, 0, 250, 250)
var view = UIView(frame: frame)
view.backgroundColor = UIColor.blackColor()
var label = UILabel(frame: CGRectMake(10, 10, 100, 100))
label.text = "Hei BEKK";
label.textColor = UIColor.whiteColor();
view.addSubview(label)


enum Barcode {
    case UPCA(a: Int, Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(a: 8, 85909, 51226, 3)
productBarcode.toRaw()
