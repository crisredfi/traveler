//
//  CircleView.swift
//  Traveler
//
//  Created by Crisredfi on 18/06/14.
//  Copyright (c) 2014 crisredfi. All rights reserved.
//

import UIKit


@IBDesignable class CircleView: UIView {
    @IBInspectable
    var image : UIImage? {
    didSet {
        refreshImage()
    }
    }
    
    @IBInspectable
    var saturation : CGFloat = 1 {
    didSet {
        refreshImage();
    }
    
    }
    
    func imageByDrawing(size : CGSize, scale : CGFloat, closure: () -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        closure()
        var result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result;
    }
    
    
    func prepareImage(source : UIImage, saturation : CGFloat = 1.0) -> UIImage {
        var size = source.size;
        var bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return imageByDrawing(size, scale: source.scale) {
            UIBezierPath(ovalInRect: bounds).addClip()
            source.drawAtPoint(CGPoint())
            UIColor(white: 1.0, alpha: 1.0 - saturation).set()
            UIRectFillUsingBlendMode(bounds, kCGBlendModeColor)
            
        }
    }
    func refreshImage() {
        imageView.image = image ? prepareImage(image!, saturation: saturation) : nil;
        backgroundColor = image ? nil : UIColor.whiteColor();
    }
    
    var imageView : UIImageView
    
    override func prepareForInterfaceBuilder()  {
        setupImage()
    }
    func setupImage() {
        if !image {
            image = UIImage(named: "aleix", inBundle: NSBundle(forClass: CircleView.self), compatibleWithTraitCollection: nil)
        }
    }
    
    init(frame: CGRect) {
        
        imageView = UIImageView(frame:CGRectZero)
        super.init(frame: frame)
        setupImage()
        addSubview(imageView)
        // Initialization code
    }
    init(coder aDecoder: NSCoder!)  {
        imageView = UIImageView(frame:CGRectZero)
        super.init(coder: aDecoder)
        setupImage()
        addSubview(imageView)
        
    }
    
    override func layoutSubviews() {
        imageView.frame = bounds
        super.layoutSubviews()
    }
    
}
