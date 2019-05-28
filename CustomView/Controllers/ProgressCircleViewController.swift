//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {

    
    @IBOutlet var progressCircle: [ProgressCircleView]!
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    @IBOutlet weak var progressPercent: UILabel!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in progressCircle {
            i.circleWidth = CGFloat(self.widthSlider.value)
            i.progressValue = CGFloat(self.progressSlider.value)
            i.targetValue = CGFloat(self.targetSlider.value)
        }
        
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        for i in progressCircle{
            i.setNeedsDisplay()
            
        }
    }
    @IBAction func widthChange(_ sender: Any) {
        
        for i in progressCircle{
            i.circleWidth = CGFloat(self.widthSlider.value)
        }
    }
    @IBAction func progessChange(_ sender: Any) {
        
        for i in progressCircle{
            i.progressValue = CGFloat(self.progressSlider.value)
        }
        progressPercent.text = String(format: "%.02f %", self.progressSlider.value * 100) + "%"

    }
    @IBAction func targetChange(_ sender: Any) {
        
        for i in progressCircle{
            i.targetValue = CGFloat(self.targetSlider.value)
        }
    }
    @IBAction func ChangeProgressColor(_ sender: UIButton) {
        for i in progressCircle{
            i.progressColor = sender.backgroundColor!
        }
    }
}

