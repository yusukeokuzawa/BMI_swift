//
//  ViewController.swift
//  BMI
//
//  Created by yusuke okuzawa on 2016/10/09.
//  Copyright © 2016 yusuke okuzawa. All rights reserved.
//

import UIKit
import Repro

class ViewController: UIViewController {

    
    @IBOutlet weak var lbResult: UILabel!
    
    @IBOutlet weak var lbWeight: UILabel!
    
    @IBOutlet weak var lbHeight: UILabel!
    
    var h:Float = 1.5
    var w:Float = 50
    var bmi:Float = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func WeightChange(_ sender: UISlider) {
        w = sender.value
        lbWeight.text  = String(format:"%.2f kg",w)
    }
    

    @IBAction func heightChange(_ sender: UISlider) {
        h = sender.value
        lbHeight.text  = String(format:"%.2f m" ,h)

    }
    
    
    @IBAction func CalculationBMI(_ sender: AnyObject) {
        Repro.track("CheckButon", properties: nil)
        bmi = w / (h*h)
        
        Repro.setDoubleUserProfile(Double(bmi), forKey:"bmi")
        
        
        var str = ""
        
//        if bmi < 18.5
//        {
//            str = String(format:"Your BMI is %.2f --> Under Weight ",bmi)
//            lbResult.backgroundColor = UIColor.orange
//        }
//        else if bmi >= 18.5 && bmi < 25
//        {
//            str = String(format:"Your BMI is %.2f --> Normal Weight keep up the good work ",bmi)
//            lbResult.backgroundColor = UIColor.green
//
//        }
//        else if bmi >= 25 && bmi < 30
//        {
//            str = String(format:"Your BMI is %.2f --> Overweight ",bmi)
//            lbResult.backgroundColor = UIColor.red
//            
//        }
//        else
//        {
//            str = String(format:"Your BMI is %.2f --> Obese ",bmi)
//            lbResult.backgroundColor = UIColor.red
//            
//        }
//
        
        switch bmi {
        case 0...18.49:
            str = String(format:"Your BMI is %.2f --> Under Weight ",bmi)
            lbResult.backgroundColor = UIColor.orange
        case 18.5...24.9:
            str = String(format:"Your BMI is %.2f --> Normal Weight keep up the good work ",bmi)
            lbResult.backgroundColor = UIColor.green
        case 25...29.9:
            str = String(format:"Your BMI is %.2f --> Overweight ",bmi)
            lbResult.backgroundColor = UIColor.red
        default:
            str = String(format:"Your BMI is %.2f --> Obese ",bmi)
            lbResult.backgroundColor = UIColor.red

        }
        
        
        lbResult.text  = str

    }
    
    
}

