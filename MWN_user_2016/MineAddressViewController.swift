//
//  MineAddressViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MineAddressViewController: UIViewController,CLLocationManagerDelegate {
    
    private var locationView = MKMapView()
    

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "我的位置"
        self.view.backgroundColor = UIColor.whiteColor()
        
//        let locationManger = CLLocationManager()
//        locationManger.delegate = self
//        locationManger.desiredAccuracy = kCLLocationAccuracyBest
//        locationManger.distanceFilter = 100.0
//        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManger.startUpdatingLocation()
//        }else{
//            print("请开启定位功能")
//        }
        
        
        locationView = MKMapView(frame: self.view.bounds)
        self.view.addSubview(locationView)
        locationView.mapType = .Standard
        let latdelta = 0.02
        let longdelta = 0.02
        var currentLocationSpan = MKCoordinateSpan()
        currentLocationSpan = MKCoordinateSpanMake(latdelta, longdelta)
//        位置坐标
        let center:CLLocation = CLLocation(latitude: 37.528502, longitude: 121.365593)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
        
//        设置显示区域
        locationView.setRegion(currentRegion, animated: true)
        
//        创建大头针
        let objectAnnotation = MKPointAnnotation()
//        设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: 37.528502, longitude: 121.365593).coordinate
        
//        设置点击大头针之后的提示
        objectAnnotation.title = "我的位置"
//        大头针描述
//        objectAnnotation.subtitle = "最新"
        
        
//        添加大头针
        locationView.addAnnotation(objectAnnotation)
        
        
        

    }

    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("=========\(newLocation.coordinate.latitude)")
        print(newLocation.coordinate.longitude)
        manager.stopUpdatingLocation()
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
