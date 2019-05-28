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
    
    @IBAction func ProgressBarButton(_ sender: Any) {
        
        self.progressBarView?.progressColor = ColorPicker.randomElement()!
        self.progressBarView?.setNeedsDisplay()
        
        
        
    }
    
    @IBAction func TargetBarButton(_ sender: Any) {
        self.progressBarView?.targetColor = ColorPicker.randomElement()!
        self.progressBarView?.setNeedsDisplay()
        
        
    }
    
    
    
    var ColorPicker = [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.5301235836, green: 0.438661907, blue: 1, alpha: 1)]
    
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
}

