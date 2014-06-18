// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str2 = "hello test"
var sample = UIImage(named : "aleix")


func imageByDrawing(size : CGSize, scale : CGFloat, closure :() -> ()) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    closure();
    var result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}


func prepareImage(source : UIImage, saturation : CGFloat = 1) -> UIImage {
    var size = source.size;
    var bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    
    return imageByDrawing(size, source.scale) {
        UIBezierPath(ovalInRect: bounds).addClip();
        source.drawAtPoint(CGPoint());
        UIColor(white: 1.0, alpha: 1.0 - saturation).set();
        UIRectFillUsingBlendMode(bounds, kCGBlendModeColor)
    }
}


prepareImage(sample)
prepareImage(sample, saturation: 1.0/3.0)