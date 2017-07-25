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
    var _subMaxSpeed:CLLocationSpeed = 0.0
    var _AverageSpeed:CLLocationSpeed = 0.0
    var distance = 0.0
    var counter = 0.0
    var cadence = 0.0
    var CurrentFront = 0.0
    var CurrentRear = 0.0
    var tire = 700.0
    let delegate = UIApplication.shared.delegate as! AppDelegate
    weak var timer: Timer!
    
    @IBAction func FrontGear(_ sender: UIStepper) {
        FrontGear.text  = Int((sender as UIStepper!).value).description
        switch Int(atof(FrontGear.text)) {
        case 1:
            CurrentFront = delegate.GearData.Front[0]
        case 2:
            CurrentFront = delegate.GearData.Front[1]
        case 3:
            CurrentFront = delegate.GearData.Front[2]
        default:
            break
        }


    }
  
    @IBAction func RearGear(_ sender: UIStepper) {
        RearGear.text = Int((sender as UIStepper!).value).description
        switch Int(atof(RearGear.text)) {
        case 1:
            CurrentRear = delegate.GearData.Rear[0]
        case 2:
            CurrentRear = delegate.GearData.Rear[1]
        case 3:
            CurrentRear = delegate.GearData.Rear[2]
        case 4:
            CurrentRear = delegate.GearData.Rear[3]
        case 5:
            CurrentRear = delegate.GearData.Rear[4]
        case 6:
            CurrentRear = delegate.GearData.Rear[5]
        case 7:
            CurrentRear = delegate.GearData.Rear[6]
        case 8:
            CurrentRear = delegate.GearData.Rear[7]
        case 9:
            CurrentRear = delegate.GearData.Rear[8]
        case 10:
            CurrentRear = delegate.GearData.Rear[9]
        case 11:
            CurrentRear = delegate.GearData.Rear[10]
        case 12:
            CurrentRear = delegate.GearData.Rear[11]
        default:
            break
        }
        }
    
    @IBOutlet var FrontGear: UILabel!
    @IBOutlet var RearGear: UILabel!
    override func viewDidLoad() {
        tire = delegate.GearData.Tire
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
    override func viewWillAppear(_ animated: Bool) {
        tire = delegate.GearData.Tire

    }
    func locationManager(_ _manager:CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus)  {
    switch status{
    case .notDetermined: _locationManager?.requestAlwaysAuthorization()
          break
    case .denied: break
    case .restricted: break
    case .authorizedAlways: break
    case .authorizedWhenInUse: break
    }
    }

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.onTick), userInfo: nil, repeats: true)
    }
    func onTick(){
        let label1: UILabel = self.view.viewWithTag(1) as! UILabel
        let label2: UILabel = self.view.viewWithTag(2) as! UILabel
        let label3: UILabel = self.view.viewWithTag(3) as! UILabel
        let label4: UILabel = self.view.viewWithTag(4) as! UILabel
        let label5: UILabel = self.view.viewWithTag(5) as! UILabel
        if _speed < 0
        { label1.text = "0" }
        else if _speed < 10
        { cadence = 0
            label1.text = Int(_speed).description
        }
        else {    label1.text = Int(_speed).description
                distance += _speed/(3600)*0.001
            cadence = round(_speed/((tire/1000 * 3.14 ) * (CurrentFront/CurrentRear) * 0.06)*10)/10
            }
        if _MaxSpeed < 0
        { label3.text = "0"}
        else { if _subMaxSpeed > _MaxSpeed
                {_MaxSpeed = _subMaxSpeed  }
                label3.text = Int(_MaxSpeed).description
            }

        if distance < 0
        {
            label2.text = "0"
        }
        else
        { label2.text = (round(distance * 100)/100).description }
        counter += 0.001
        _AverageSpeed = distance/counter * 3600
        if _AverageSpeed < 0 {
            label4.text = ""
        }
        else
        { label4.text = Int(_AverageSpeed).description }
        if cadence < 0
        { label5.text = " 0.0" }
        else { label5.text = cadence.description }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       guard let newLocation = locations.last,CLLocationCoordinate2DIsValid(newLocation.coordinate) else {
            return
        }
        if newLocation.speed * 3.6 > _speed
        { _subMaxSpeed = newLocation.speed * 3.6  }
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
    
    @IBAction func map(_ sender: Any) {
        self.performSegue(withIdentifier: "ToMap", sender: self)
    }
    
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

