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
    @IBOutlet weak var progressCircleView2: ProgressCircleView?
    @IBOutlet weak var progressCircleView3: ProgressCircleView?
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressCircleView2?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView2?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView2?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressCircleView3?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView3?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView3?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressCircleView?.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView2?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView3?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView2?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView3?.progressValue = CGFloat(self.progressSlider.value)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.progressCircleView2?.targetValue = CGFloat(self.targetSlider.value)
        self.progressCircleView3?.targetValue = CGFloat(self.targetSlider.value)
    }
}

