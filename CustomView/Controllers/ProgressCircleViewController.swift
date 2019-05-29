//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {

    @IBOutlet weak var progressCircleView: ProgressCircleView?
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    @IBOutlet weak var circleColor: UISlider!
    @IBOutlet weak var progressColor: UISlider!
    @IBOutlet weak var targetColor: UISlider!

    
    @IBOutlet weak var pocent: UILabel!
    
    var firstColor = #colorLiteral(red: 0.992390573, green: 0.5031119585, blue: 1, alpha: 0.6875550176)
    var secondColor = #colorLiteral(red: 0.6687839031, green: 0.4701688886, blue: 1, alpha: 0.6875550176)
    var thirdColor = #colorLiteral(red: 1, green: 0.4376526475, blue: 0.6227459311, alpha: 0.6875550176)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressCircleView?.circleColor = firstColor
        self.progressCircleView?.progressColor = secondColor
        self.progressCircleView?.targetColor = thirdColor
        
        self.pocent?.text = String(format: "%.2f", CGFloat(self.progressSlider.value) * 100) + "%"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressCircleView?.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.pocent?.text = String(format: "%.2f", CGFloat(self.progressSlider.value) * 100) + "%"
        

    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    //COLORS
    @IBAction func circleColor(_ sender: UISlider) {
        if sender.value <= 0.3 {
            progressCircleView?.circleColor = firstColor
            sender.maximumTrackTintColor = firstColor
        } else if sender.value > 0.3 && sender.value <= 0.6 {
            progressCircleView?.circleColor = secondColor
            sender.maximumTrackTintColor = secondColor
        } else {
            progressCircleView?.circleColor = thirdColor
            sender.maximumTrackTintColor = thirdColor
        }
    }
    @IBAction func progressColor(_ sender: UISlider) {
        if sender.value <= 0.3 {
            progressCircleView?.progressColor = firstColor
            sender.maximumTrackTintColor = firstColor
        } else if sender.value > 0.3 && sender.value <= 0.6 {
            progressCircleView?.progressColor = secondColor
            sender.maximumTrackTintColor = secondColor
        } else {
            progressCircleView?.progressColor = thirdColor
            sender.maximumTrackTintColor = thirdColor
        }
        self.pocent?.text = "\(CGFloat(self.progressSlider.value)*100)%"
        
    }
    @IBAction func targetColor(_ sender: UISlider) {
        if sender.value <= 0.3 {
            progressCircleView?.targetColor = firstColor
            sender.maximumTrackTintColor = firstColor
        } else if sender.value > 0.3 && sender.value <= 0.6 {
            progressCircleView?.targetColor = secondColor
            sender.maximumTrackTintColor = secondColor
        } else {
            progressCircleView?.targetColor = thirdColor
            sender.maximumTrackTintColor = thirdColor
        }
    }

}

