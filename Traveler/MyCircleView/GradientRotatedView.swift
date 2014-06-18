//
//  GradientRotatedView.swift
//  Traveler
//
//  Created by Crisredfi on 18/06/14.
//  Copyright (c) 2014 crisredfi. All rights reserved.
//

import UIKit
import QuartzCore


@IBDesignable class GradientRotatedView: UIView {
    
    let gradient : CAGradientLayer = CAGradientLayer();

    @IBInspectable
    var mainColor : UIColor = UIColor.redColor() {
        didSet {
        redrawBackgroundColor()
        }
    }
    @IBInspectable
    var midColor : UIColor = UIColor.blueColor() {
    didSet {
        redrawBackgroundColor()
    }
    }
    @IBInspectable
    var lastColor : UIColor = UIColor.greenColor() {
    didSet {
        redrawBackgroundColor()
    }
    }
    
   
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        redrawBackgroundColor()
    }
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
        redrawBackgroundColor()        
    }
    
    override func prepareForInterfaceBuilder()  {
        redrawBackgroundColor()

    }
    


    func redrawBackgroundColor() {
        
        self.gradient.removeFromSuperlayer();
        
        gradient.frame = bounds;
        gradient.startPoint = CGPointMake(1, 1)
        gradient.endPoint = CGPointMake(0, 0)
        gradient.colors = [mainColor.CGColor, midColor.CGColor, lastColor.CGColor];
        self.layer.insertSublayer(gradient, atIndex:0)

    }
}
