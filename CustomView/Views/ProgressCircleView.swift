//
//  ProgressCircle.swift
//  CustomViewComponent
//
//  Modified by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//
//  Created by Joaquim Pessôa Filho on 9/5/15.
//  Copyright (c) 2015 Mackenzie. All rights reserved.
//

import UIKit

// Consigo ver o meu desenho na storyboard enquanto uso
@IBDesignable
class ProgressCircleView: UIView {
    
    // Aparecem os atributos no inspector
    @IBInspectable
    // The value of current progress between 0.0 and 1.0
    var progressValue:CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
            progressLabel?.text = String(format: "Progress: %.2f%%", progressValue * 100)
        }
    }
    
    @IBInspectable
    // TargetValue is a value between 0.0 and 1.0 that represent the value to be archieved
    var targetValue:CGFloat = 0.75 {
        didSet {
            setNeedsDisplay()
            targetLabel?.text = String(format: "Target: %.2f%%", targetValue * 100)
        }
    }
    
    @IBInspectable
    var circleWidth:CGFloat = 10.0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var circleColor:UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var progressColor:UIColor = UIColor.yellow {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var targetColor:UIColor = UIColor.green {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var targetLabel: UILabel!
    var progressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        targetLabel = UILabel()
        targetLabel.font = UIFont(name: "Helvetica Neue", size: 12)
        targetLabel.frame.size = CGSize(width: 110, height: 80)
        targetLabel.textAlignment = .center
        targetLabel.center = CGPoint(x: self.center.x, y: self.center.y - 20)
        targetLabel.isHidden = true
        
        progressLabel = UILabel()
        progressLabel.font = UIFont(name: "Helvetica Neue", size: 12)
        progressLabel.frame.size = CGSize(width: 110, height: 80)
        progressLabel.textAlignment = .center
        progressLabel.center = CGPoint(x: self.center.x, y: self.center.y)
        progressLabel.isHidden = true
        
        self.addSubview(targetLabel)
        self.addSubview(progressLabel)
    }
    
    // Method that draw the circle, progress and target
    override func draw(_ rect: CGRect) {
        //Important constants for circle
        let fullCircle = CGFloat(2.0 * Double.pi)
        
        // Position where the circle starts to be drawn
        // -0,25 represents the top center of the circle, 0 represents the middle right
        let start:CGFloat = -0.25 * fullCircle
        
        // Calculate de position of progress in the circumference
        let progressEnd:CGFloat = progressValue * fullCircle + start
        
        // Calculate de position of target in the circumference
        let targetEnd:CGFloat = targetValue * fullCircle + start
        
        // Find the centerpoint of the rect (View)
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        // Sets the radius by the smallest side of the view
        var radius:CGFloat = 0.0
        
        // O raio vai ser o menor entre a altura e o
        if rect.width < rect.height{
            radius = (rect.width - circleWidth) / 2.0
        }else{
            radius = (rect.height - circleWidth) / 2.0
        }
        
        // Starting point for all drawing code is getting the context
        let context = UIGraphicsGetCurrentContext()
        
        // Set line attributes
        context?.setLineWidth(circleWidth)
        context?.setLineCap(CGLineCap.round)
        
        // Draw the MAIN circle (background)
        context?.setStrokeColor(self.circleColor.cgColor)
        context?.addArc(center: centerPoint, radius: radius, startAngle: 0, endAngle: fullCircle, clockwise: false)
        context?.strokePath()
        
        // Draw the TARGET circle
        context?.setStrokeColor(self.targetColor.cgColor)
        context?.addArc(center: centerPoint, radius: radius, startAngle: start, endAngle: targetEnd, clockwise: false)
        context?.strokePath()
        
        // Draw the PROGRESS circle
        context?.setStrokeColor(progressColor.cgColor)
        context?.addArc(center: centerPoint, radius: radius, startAngle: start, endAngle: progressEnd, clockwise: false)
        context?.strokePath()
        
    }
    
    func hideLabel() {
        targetLabel.isHidden = true
        progressLabel.isHidden = true
    }
    
    func showLabel() {
        targetLabel.isHidden = false
        progressLabel.isHidden = false
    }
}
