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
    
    var firstColor = #colorLiteral(red: 0.992390573, green: 0.5031119585, blue: 1, alpha: 0.6875550176)
    var secondColor = #colorLiteral(red: 0.6687839031, green: 0.4701688886, blue: 1, alpha: 0.6875550176)
    var thirdColor = #colorLiteral(red: 1, green: 0.4376526475, blue: 0.6227459311, alpha: 0.6875550176)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressBarView?.lineWidth = CGFloat(self.widthSlider.value)
        self.progressBarView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressBarView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressBarView?.lineColor = firstColor
        self.progressBarView?.progressColor = secondColor
        self.progressBarView?.targetColor = thirdColor
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
    //COLORS
    @IBAction func circleColor(_ sender: UISlider) {
        if sender.value <= 0.3 {
            progressBarView?.lineColor = firstColor
            sender.maximumTrackTintColor = firstColor
        } else if sender.value > 0.3 && sender.value <= 0.6 {
            progressBarView?.lineColor = secondColor
            sender.maximumTrackTintColor = secondColor
        } else {
            progressBarView?.lineColor = thirdColor
            sender.maximumTrackTintColor = thirdColor
        }
    }
    @IBAction func progressColor(_ sender: UISlider) {
        if sender.value <= 0.3 {
            progressBarView?.progressColor = firstColor
            sender.maximumTrackTintColor = firstColor
        } else if sender.value > 0.3 && sender.value <= 0.6 {
            progressBarView?.progressColor = secondColor
            sender.maximumTrackTintColor = secondColor
        } else {
            progressBarView?.progressColor = thirdColor
            sender.maximumTrackTintColor = thirdColor
        }
        
    }
    @IBAction func targetColor(_ sender: UISlider) {
        if sender.value <= 0.3 {
            progressBarView?.targetColor = firstColor
            sender.maximumTrackTintColor = firstColor
        } else if sender.value > 0.3 && sender.value <= 0.6 {
            progressBarView?.targetColor = secondColor
            sender.maximumTrackTintColor = secondColor
        } else {
            progressBarView?.targetColor = thirdColor
            sender.maximumTrackTintColor = thirdColor
        }
    }
}

