//
//  ViewController.swift
//  Cycle Navi
//
//  Created by 조대희 on 2017. 6. 2..
//  Copyright © 2017년 山本大煕. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate {
    var _label:UILabel?
    var _locationManager:CLLocationManager?
    var _latitude:CLLocationDegrees = 0.0
    var _longitude:CLLocationDegrees = 0.0
    var _heading:CLLocationDirection = 0.0
    var _speed:CLLocationSpeed = 0.0
    var _MaxSpeed:CLLocationSpeed = 0.0
    var _AverageSpeed:CLLocationSpeed = 0.0
    var distance = 0.0
    var counter = 0.0
    weak var timer: Timer!
    
   @IBOutlet weak var FrontGear: UILabel!
      @IBOutlet var FrontGearStepper: UIStepper!
    @IBAction func FrontGearStepper(sender: UIStepper) {
        FrontGear.text = "\(sender.value)"
    }

    
    override func viewDidLoad() {
               super.viewDidLoad()
        
       

        // Do any additional setup after loading the view, typically from a nib.
        //ロケーションマネージャの作成
        _locationManager = CLLocationManager()
        _locationManager?.requestAlwaysAuthorization()
        _locationManager?.delegate = self
        
        //位置情報の通知
        if CLLocationManager.locationServicesEnabled()
        {
            _locationManager?.startUpdatingLocation() }
        
        //方位情報の通知
        if CLLocationManager.headingAvailable()
        { _locationManager?.startUpdatingHeading() }
        
        startTimer()
        
    }

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.onTick), userInfo: nil, repeats: true)
    }
    func onTick(){
        let label1: UILabel = self.view.viewWithTag(1) as! UILabel
        let label2: UILabel = self.view.viewWithTag(2) as! UILabel
        let label3: UILabel = self.view.viewWithTag(3) as! UILabel
        let label4: UILabel = self.view.viewWithTag(4) as! UILabel
        label1.text = Int(_speed).description
        label3.text = Int(_MaxSpeed).description
        distance += _speed/(3600)*0.01
        label2.text = (round(distance * 100)/100).description
        counter += 0.01
        _AverageSpeed = distance/counter * 3600
        label4.text = Int(_AverageSpeed).description
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       guard let newLocation = locations.last,CLLocationCoordinate2DIsValid(newLocation.coordinate) else {
            return
        }
        if newLocation.speed * 3.6 > _speed
        { _MaxSpeed = newLocation.speed * 3.6  }
        _speed = newLocation.speed * 3.6
        
        
        //.appendingFormat("%.2f",newLocation.speed*3.6)
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        _heading = newHeading.trueHeading
        let label6: UILabel = self.view.viewWithTag(6) as! UILabel
       label6.text = Int(_heading).description
    }
    @IBAction func setting(_ sender: Any) {
        self.performSegue(withIdentifier: "ToSetting", sender: self )
    }
    
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
