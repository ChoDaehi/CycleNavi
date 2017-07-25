//
//  MapViewController.swift
//  Cycle Navi
//
//  Created by 조대희 on 2017. 7. 15..
//  Copyright © 2017년 山本大煕. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate {
    var _mapview: MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()

        _mapview = makeMapView(frame: self.view.frame)
        self.view.addSubview(_mapview!)
        
        
        // Do any additional setup after loading the view.
    }
    func makeMapView(frame: CGRect) -> MKMapView{
        let mapView = MKMapView()
        mapView.frame = frame
        mapView.mapType = MKMapType.standard
        mapView.autoresizingMask = UIViewAutoresizing.flexibleBottomMargin |
        UIViewAutoresizing.flexibleHeight |
        UIViewAutoresizing.flexibleLeftMargin |
        UIViewAutoresizing.flexibleRightMargin |
        UIViewAutoresizing.flexibleTopMargin |
        UIViewAutoresizing.flexibleWidth
    mapView.delegate = self
        return mapView;
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
