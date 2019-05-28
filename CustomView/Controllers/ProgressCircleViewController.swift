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
    @IBOutlet weak var Progress: UILabel!
    
    var ColorPicker = [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.5301235836, green: 0.438661907, blue: 1, alpha: 1)]
    
    var porcentagem: Float = 0 {
        didSet{
            Progress.text = "\(String(format: "%.2f",porcentagem*100))%"
        }
    }
    
    @IBOutlet weak var Thrid: ProgressCircleView!
    @IBOutlet weak var xzx: ProgressCircleView!
    
    @IBAction func ColorProgress(_ sender: Any) {
        self.progressCircleView?.progressColor = ColorPicker.randomElement()!
        self.xzx.progressColor = ColorPicker.randomElement()!
        self.Thrid.progressColor = ColorPicker.randomElement()!
        self.xzx.setNeedsDisplay()
        self.Thrid.setNeedsDisplay()
        self.progressCircleView?.setNeedsDisplay()
    }
    
    
    
    
    @IBAction func TargetColor(_ sender: Any) {
        self.progressCircleView?.targetColor = ColorPicker.randomElement()!
        self.xzx.targetColor = ColorPicker.randomElement()!
        self.Thrid.targetColor = ColorPicker.randomElement()!
        self.xzx.setNeedsDisplay()
        self.Thrid.setNeedsDisplay()
        self.progressCircleView?.setNeedsDisplay()
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        porcentagem = self.progressSlider.value
        
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.xzx.circleWidth = CGFloat(self.widthSlider.value)
        self.xzx.progressValue = CGFloat(self.progressSlider.value)
        self.xzx.targetValue = CGFloat(self.targetSlider.value)
        
        
        self.Thrid.circleWidth = CGFloat(self.widthSlider.value)
        self.Thrid.progressValue = CGFloat(self.progressSlider.value)
        self.Thrid.targetValue = CGFloat(self.targetSlider.value)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressCircleView?.setNeedsDisplay()
        self.Thrid.setNeedsDisplay()
        self.xzx.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.xzx.circleWidth = CGFloat(self.widthSlider.value)
        self.Thrid.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.xzx.progressValue = CGFloat(self.progressSlider.value)
        self.Thrid.progressValue = CGFloat(self.progressSlider.value)
        porcentagem = self.progressSlider.value
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.xzx.targetValue = CGFloat(self.targetSlider.value)
        self.Thrid.targetValue = CGFloat(self.targetSlider.value)
    }
}

