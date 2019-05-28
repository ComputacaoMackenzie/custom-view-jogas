//
//  ProgressBarViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 26/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressBarViewController: UITableViewController {
    
    @IBOutlet weak var progressBarView: ProgressBarView?
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressBarView?.lineWidth = CGFloat(self.widthSlider.value)
        self.progressBarView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressBarView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressBarView?.setNeedsDisplay()
    }
    
    @IBAction func widthChange(_ sender: Any) {
        self.progressBarView?.lineWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.progressBarView?.progressValue = CGFloat(self.progressSlider.value)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressBarView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        let color = UIColor.random
        sender.backgroundColor = color
        
        switch sender.tag {
        case 0:
            progressBarView?.lineColor = color
            self.widthSlider.tintColor = color
        case 1:
            progressBarView?.progressColor = color
            self.progressSlider.tintColor = color
        case 2:
            progressBarView?.targetColor = color
            self.targetSlider.tintColor = color
        default:
            break
        }
        
    }
}
