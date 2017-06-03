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
    var Gear : [GearMemory] = []
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
        sc.frame = self.view.frame;
        sc.delegate = self;
        let gear1 = GearMemory()
        let gear2 = GearMemory()
        let gear3 = GearMemory()
        let gear4 = GearMemory()
        let gear5 = GearMemory()
        let gear6 = GearMemory()
        let gear7 = GearMemory()
        let gear8 = GearMemory()
        let gear9 = GearMemory()
        let gear10 = GearMemory()
        let gear11 = GearMemory()
        let gear12 = GearMemory()
        F1.text = gear1.front.description
        F2.text = gear2.front.description
        F3.text = gear3.front.description
        
        R1.text = gear1.rear.description
        R2.text = gear2.rear.description
        R3.text = gear3.rear.description
        R4.text = gear4.rear.description
        R5.text = gear5.rear.description
        R6.text = gear6.rear.description
        R7.text = gear7.rear.description
        R8.text = gear8.rear.description
        R9.text = gear9.rear.description
        R10.text = gear10.rear.description
        R11.text = gear11.rear.description
        R12.text = gear12.rear.description
    super.viewDidLoad()
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
    override func viewDidDisappear(_ animated: Bool) {
       let delegate = UIApplication.shared.delegate as! AppDelegate
        switch delegate.GearData.Front {
        case 1:
            front = atof(F1.text)
        case 2:
            front = atof(F2.text)
        case 3:
            front = atof(F3.text)
        default: break
        }
        switch delegate.GearData.Rear {
        case 1:
            rear = atof(R1.text)
        case 2:
            rear = atof(R2.text)
        case 3:
            rear = atof(R3.text)
        case 4:
            rear = atof(R4.text)
        case 5:
            rear = atof(R5.text)
        case 6:
            rear = atof(R6.text)
        case 7:
            rear = atof(R7.text)
        case 8:
            rear = atof(R8.text)
        case 9:
            rear = atof(R9.text)
        case 10:
            rear = atof(R10.text)
        case 11:
            rear = atof(R11.text)
        case 12:
            rear = atof(R12.text)
        default: break
        }
        distanceOfOneRotation = atof(tire.text)/2000 * 2 * 3.14 * front/rear
        delegate.GearData.DistanceOfOneRotation  = distanceOfOneRotation
        let gear1 = GearMemory()
            gear1.front = Int(atof(F1.text))
            gear1.rear  = Int(atof(R1.text))
            Gear.append(gear1)
        let gear2 = GearMemory()
            gear2.front = Int(atof(F2.text))
            gear2.rear  = Int(atof(R2.text))
            Gear.append(gear2)
        let gear3 = GearMemory()
            gear3.front = Int(atof(F3.text))
            gear3.rear  = Int(atof(R3.text))
            Gear.append(gear3)
        let gear4 = GearMemory()
            gear4.rear  = Int(atof(R4.text))
            Gear.append(gear4)
        let gear5 = GearMemory()
            gear5.rear  = Int(atof(R5.text))
            Gear.append(gear5)
        let gear6 = GearMemory()
            gear6.rear = Int(atof(R6.text))
            Gear.append(gear6)
        let gear7 = GearMemory()
            gear7.rear  = Int(atof(R7.text))
            Gear.append(gear7)
        let gear8 = GearMemory()
            gear8.rear  = Int(atof(R8.text))
            Gear.append(gear8)
        let gear9 = GearMemory()
            gear9.rear  = Int(atof(R9.text))
            Gear.append(gear9)
        let gear10 = GearMemory()
            gear6.rear = Int(atof(R10.text))
            Gear.append(gear10)
        let gear11 = GearMemory()
            gear11.rear  = Int(atof(R11.text))
            Gear.append(gear11)
        let gear12 = GearMemory()
            gear12.rear  = Int(atof(R12.text))
            Gear.append(gear12)
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
