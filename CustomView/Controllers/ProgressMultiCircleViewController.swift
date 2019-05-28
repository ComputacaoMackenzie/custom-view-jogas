//
//  ProgressMultiCircleViewController.swift
//  CustomView
//
//  Created by Matheus Gois on 28/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressMultiCircleViewController: UITableViewController {
    
    @IBOutlet weak var ProgressMultiCircleView: ProgressMultiCircleView?
    @IBOutlet weak var ProgressMultiCircleView2: ProgressMultiCircleView?
    @IBOutlet weak var ProgressMultiCircleView3: ProgressMultiCircleView?
    @IBOutlet weak var ProgressMultiCircleView4: ProgressMultiCircleView?
    
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ProgressMultiCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.ProgressMultiCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.ProgressMultiCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.ProgressMultiCircleView2?.circleWidth = CGFloat(self.widthSlider.value)
        self.ProgressMultiCircleView2?.progressValue = CGFloat(self.progressSlider.value)
        self.ProgressMultiCircleView2?.targetValue = CGFloat(self.targetSlider.value)
        
        self.ProgressMultiCircleView3?.circleWidth = CGFloat(self.widthSlider.value)
        self.ProgressMultiCircleView3?.progressValue = CGFloat(self.progressSlider.value)
        self.ProgressMultiCircleView3?.targetValue = CGFloat(self.targetSlider.value)
        
        self.ProgressMultiCircleView4?.circleWidth = CGFloat(self.widthSlider.value)
        self.ProgressMultiCircleView4?.progressValue = CGFloat(self.progressSlider.value)
        self.ProgressMultiCircleView4?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.ProgressMultiCircleView?.setNeedsDisplay()
        self.ProgressMultiCircleView2?.setNeedsDisplay()
        self.ProgressMultiCircleView3?.setNeedsDisplay()
        self.ProgressMultiCircleView4?.setNeedsDisplay()
    }
    
    @IBAction func widthChange(_ sender: Any) {
        self.ProgressMultiCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.ProgressMultiCircleView2?.circleWidth = CGFloat(self.widthSlider.value)
        self.ProgressMultiCircleView3?.circleWidth = CGFloat(self.widthSlider.value)
        self.ProgressMultiCircleView4?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.ProgressMultiCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.ProgressMultiCircleView2?.progressValue = CGFloat(self.progressSlider.value)
        self.ProgressMultiCircleView3?.progressValue = CGFloat(self.progressSlider.value)
        self.ProgressMultiCircleView4?.progressValue = CGFloat(self.progressSlider.value)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.ProgressMultiCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.ProgressMultiCircleView2?.targetValue = CGFloat(self.targetSlider.value)
        self.ProgressMultiCircleView3?.targetValue = CGFloat(self.targetSlider.value)
        self.ProgressMultiCircleView4?.targetValue = CGFloat(self.targetSlider.value)
    }
   
    
    
    
    
}
