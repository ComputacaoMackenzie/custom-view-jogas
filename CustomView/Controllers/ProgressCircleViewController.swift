//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {

    @IBOutlet weak var largestProgressCircleView: ProgressCircleView?
    @IBOutlet weak var mediumProgressCircleView: ProgressCircleView?
    @IBOutlet weak var smallerProgressCircleView: ProgressCircleView?
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.largestProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.largestProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.largestProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.mediumProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.mediumProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.mediumProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.smallerProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.smallerProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.smallerProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.largestProgressCircleView?.setNeedsDisplay()
        self.mediumProgressCircleView?.setNeedsDisplay()
        self.smallerProgressCircleView?.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.largestProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.mediumProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.smallerProgressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.largestProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.mediumProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.smallerProgressCircleView?.progressValue = CGFloat(self.progressSlider.value)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.largestProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.mediumProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.smallerProgressCircleView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    @IBAction func colorChange(_ button: UIButton) {
        let color = UIColor.random
        button.backgroundColor = color
        
        switch button.tag {
            case 0:
                self.largestProgressCircleView?.circleColor = color
                self.widthSlider.tintColor = color
            case 1:
                self.largestProgressCircleView?.progressColor = color
                self.progressSlider.tintColor = color
            case 2:
                self.largestProgressCircleView?.targetColor = color
                self.targetSlider.tintColor = color
            default:
                break
        }
    }
    
    @IBAction func challengeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sender.tintColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
            mediumProgressCircleView?.isHidden = false
            smallerProgressCircleView?.isHidden = false
            
            largestProgressCircleView?.hideLabels()
            mediumProgressCircleView?.hideLabels()
            smallerProgressCircleView?.hideLabels()
        default:
            sender.tintColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            mediumProgressCircleView?.isHidden = true
            smallerProgressCircleView?.isHidden = true
            
            largestProgressCircleView?.showLabels()
            mediumProgressCircleView?.showLabels()
            smallerProgressCircleView?.showLabels()
        }
    }
    
}
