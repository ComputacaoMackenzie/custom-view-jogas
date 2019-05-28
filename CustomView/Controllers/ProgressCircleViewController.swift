//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {

    @IBOutlet weak var biggestProgressCircleView: ProgressCircleView?
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    @IBOutlet weak var mediumProgressCircleView: ProgressCircleView!
    @IBOutlet weak var smallerProgressCircleView: ProgressCircleView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.biggestProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.biggestProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.biggestProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.mediumProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.mediumProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.mediumProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.smallerProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.smallerProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.smallerProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.biggestProgressCircleView?.setNeedsDisplay()
        self.mediumProgressCircleView?.setNeedsDisplay()
        self.smallerProgressCircleView?.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.biggestProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.mediumProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.smallerProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.biggestProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.mediumProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.smallerProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.biggestProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.mediumProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.smallerProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        let color = UIColor.random
        sender.backgroundColor = color
        
        switch sender.tag {
            case 0:
                biggestProgressCircleView?.circleColor = color
                mediumProgressCircleView?.circleColor = color
                smallerProgressCircleView?.circleColor = color
                self.widthSlider.tintColor = color
            case 1:
                biggestProgressCircleView?.progressColor = color
                mediumProgressCircleView?.progressColor = color
                smallerProgressCircleView?.progressColor = color
                self.progressSlider.tintColor = color
            case 2:
                biggestProgressCircleView?.targetColor = color
                mediumProgressCircleView?.targetColor = color
                smallerProgressCircleView?.targetColor = color
                self.targetSlider.tintColor = color
            default:
                break
        }
        
    }
    
    @IBAction func typeOfChallengeChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            biggestProgressCircleView?.hideLabel()
            mediumProgressCircleView.hideLabel()
            smallerProgressCircleView.hideLabel()
            biggestProgressCircleView?.isHidden = false
            mediumProgressCircleView.isHidden = false
            smallerProgressCircleView.isHidden = false
        default:
            biggestProgressCircleView?.showLabel()
            mediumProgressCircleView.showLabel()
            smallerProgressCircleView.showLabel()
            mediumProgressCircleView.isHidden = true
            smallerProgressCircleView.isHidden = true
        
        }
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}
