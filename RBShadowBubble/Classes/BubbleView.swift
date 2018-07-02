//
//  TriangleView.swift
//  Draw
//
//  Created by Reza Bina on 6/22/18.
//  Copyright © 2018 iOS Developer. All rights reserved.
//

import UIKit

public class BubbleView: UIView {
    
    @IBInspectable public var cornerRadius : CGFloat = 5 {
        didSet {
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var padding : CGFloat = 20 {
        didSet {
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var bubbleBackground : UIColor = UIColor.white {
        didSet {
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.black.withAlphaComponent(0.1) {
        didSet {
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var shadowColor : UIColor = UIColor.black.withAlphaComponent(0.2) {
        didSet {
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var shadowOpacity : Float = 1.0 {
        didSet {
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var shadowOffset : CGSize = CGSize(width: 1, height: 1) {
        didSet {
            self.setNeedsDisplay()
            self.setNeedsLayout()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: cornerRadius + padding, y: padding))
        path.addLine(to: CGPoint(x: self.frame.size.width - (cornerRadius + padding), y: padding))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width - (cornerRadius + padding), y: cornerRadius + padding), radius: cornerRadius, startAngle: -.pi/2,    endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: self.frame.size.width - padding, y: self.frame.height - 20 - cornerRadius))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width - (cornerRadius + padding), y: self.frame.height - 20 - cornerRadius), radius: cornerRadius, startAngle: 0, endAngle: -(3 * (.pi / 2)), clockwise: true)
        path.addLine(to: CGPoint(x: self.center.x + 20, y: self.frame.height - 20))
        path.addLine(to: CGPoint(x: self.center.x, y: self.frame.height))
        path.addLine(to: CGPoint(x: self.center.x - 20, y: self.frame.height - 20))
        
        path.addLine(to: CGPoint(x: cornerRadius + padding, y: self.frame.height - 20))
        path.addArc(withCenter: CGPoint(x: cornerRadius + padding, y: self.frame.height - 20 - cornerRadius), radius: cornerRadius, startAngle: -(3 * (.pi / 2)), endAngle: -.pi, clockwise: true)
        path.addLine(to: CGPoint(x: padding, y: cornerRadius + padding))
        path.addArc(withCenter: CGPoint(x: cornerRadius + padding, y: cornerRadius + padding), radius: cornerRadius, startAngle: -.pi, endAngle: -(.pi / 2), clockwise: true)
        
        let shadowLayer = CALayer()
        shadowLayer.shadowPath = path.cgPath
        shadowLayer.shadowColor = self.shadowColor.cgColor
        shadowLayer.shadowOffset = self.shadowOffset
        shadowLayer.shadowOpacity = self.shadowOpacity
        self.layer.addSublayer(shadowLayer)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = self.bubbleBackground.cgColor
        shapeLayer.strokeColor = self.borderColor.cgColor
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
    
}


