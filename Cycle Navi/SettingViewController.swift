//
//  SettingViewController.swift
//  Cycle Navi
//
//  Created by 조대희 on 2017. 6. 3..
//  Copyright © 2017년 山本大煕. All rights reserved.
//

import UIKit
import Darwin

class SettingViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate{

    var front = 0.0
    var rear = 0.0
    var txtActiveField = UITextField()
    var distanceOfOneRotation = 0.0
    var DefaultView = 0.0

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
    @IBOutlet weak var Scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tire.delegate = self
        
        F1.delegate = self
        F2.delegate = self
        F3.delegate = self
        
        R1.delegate = self
        R2.delegate = self
        R3.delegate = self
        
        R4.delegate = self
        R5.delegate = self
        R6.delegate = self
        
        R7.delegate = self
        R8.delegate = self
        R9.delegate = self
       
        R10.delegate = self
        R11.delegate = self
        R12.delegate = self
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

    
    func textFieldDidBeginEditing(_ textField: UITextField)  {
        txtActiveField = textField
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        
        return true
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(SettingViewController.handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
      notificationCenter.addObserver(self, selector: #selector(SettingViewController.handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        

   }
    
    
    
 func handleKeyboardWillShowNotification(_ notification:Notification)
    {
        let userInfo = (notification as NSNotification).userInfo!
        // キーボードの大きさを取得
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // 画面サイズの取得 (ステータスバー領域を含む画面のサイズを返す)
        let myBoundSize: CGSize = UIScreen.main.bounds.size
        
        // TextFieldの下辺を割り出す
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 120.0
        
        // キーボードの大きさを取得
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
        DefaultView = Double(Scrollview.contentOffset.y)
        
        // TextFieldの表示位置がキーボードより「下」の場合、画面を移動させる
        if txtLimit >= kbdLimit {
           Scrollview.contentOffset.y = txtLimit - kbdLimit
       }

        
    }
 func handleKeyboardWillHideNotification(_ notification: Notification) {
        Scrollview.contentOffset.y = CGFloat(DefaultView)
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
