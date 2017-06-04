//
//  SettingViewController.swift
//  Cycle Navi
//
//  Created by 조대희 on 2017. 6. 3..
//  Copyright © 2017년 山本大煕. All rights reserved.
//

import UIKit
import Darwin

class SettingViewController: UIViewController, UITextFieldDelegate,UIScrollViewDelegate{
    let sc = UIScrollView()
    var front = 0.0
    var rear = 0.0
    var distanceOfOneRotation = 0.0
    @IBOutlet var tire: UITextField!
   
    @IBOutlet var F1: UITextField!
    @IBOutlet var F2: UITextField!
    @IBOutlet var F3: UITextField!
    
    @IBOutlet var R1: UITextField!
    @IBOutlet var R2: UITextField!
    @IBOutlet var R3: UITextField!
    @IBOutlet var R4: UITextField!
    @IBOutlet var R5: UITextField!
    @IBOutlet var R6: UITextField!
    @IBOutlet var R7: UITextField!
    @IBOutlet var R8: UITextField!
    @IBOutlet var R9: UITextField!
    @IBOutlet var R10: UITextField!
    @IBOutlet var R11: UITextField!
    @IBOutlet var R12: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        sc.frame = self.view.frame;
        sc.delegate = self;
    let delegate = UIApplication.shared.delegate as! AppDelegate
        tire.text = delegate.GearData.Tire.description
        
        F1.text = round(delegate.GearData.Front[0]).description
        F2.text = round(delegate.GearData.Front[1]).description
        F3.text = round(delegate.GearData.Front[2]).description
        
        R1.text = round(delegate.GearData.Rear[0]).description
        R2.text = round(delegate.GearData.Rear[1]).description
        R3.text = round(delegate.GearData.Rear[2]).description
        R4.text = round(delegate.GearData.Rear[3]).description
        R5.text = round(delegate.GearData.Rear[4]).description
        R6.text = round(delegate.GearData.Rear[5]).description
        R7.text = round(delegate.GearData.Rear[6]).description
        R8.text = round(delegate.GearData.Rear[7]).description
        R9.text = round(delegate.GearData.Rear[8]).description
        R10.text = round(delegate.GearData.Rear[9]).description
        R11.text = round(delegate.GearData.Rear[10]).description
        R12.text = round(delegate.GearData.Rear[11]).description
    
    }
    @IBAction func tire(_ sender: UITextField) {
    }
   
    @IBAction func F1(_ sender: UITextField) {
    }
    @IBAction func F2(_ sender: UITextField) {
    }
    @IBAction func F3(_ sender: UITextField) {
    }
    
    @IBAction func R1(_ sender: UITextField) {
    }
    @IBAction func R2(_ sender: UITextField) {
    }
    @IBAction func R3(_ sender: UITextField) {
    }
    @IBAction func R4(_ sender: UITextField) {
    }
    @IBAction func R5(_ sender: UITextField) {
    }
    @IBAction func R6(_ sender: UITextField) {
    }
    @IBAction func R7(_ sender: UITextField) {
    }
    @IBAction func R8(_ sender: UITextField) {
    }
    @IBAction func R9(_ sender: UITextField) {
    }
    @IBAction func R10(_ sender: UITextField) {
    }
    @IBAction func R11(_ sender: UITextField) {
    }
    @IBAction func R12(_ sender: UITextField) {
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.GearData.Tire = atof(tire.text)
        
            delegate.GearData.Front[0] = atof(F1.text)
            delegate.GearData.Rear[0]  = atof(R1.text)
        
            delegate.GearData.Front[1] = atof(F2.text)
            delegate.GearData.Rear[1]  = atof(R2.text)
        
            delegate.GearData.Front[2] = atof(F3.text)
            delegate.GearData.Rear[2]  = atof(R3.text)
        
            delegate.GearData.Rear[3]  = atof(R4.text)
        
            delegate.GearData.Rear[4] = atof(R5.text)
            delegate.GearData.Rear[5] = atof(R6.text)
            delegate.GearData.Rear[6] = atof(R7.text)
            delegate.GearData.Rear[7]  = atof(R8.text)
            delegate.GearData.Rear[8]  = atof(R9.text)
            delegate.GearData.Rear[9] = atof(R10.text)
            delegate.GearData.Rear[10]  = atof(R11.text)
            delegate.GearData.Rear[11]  = atof(R12.text)
               }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
