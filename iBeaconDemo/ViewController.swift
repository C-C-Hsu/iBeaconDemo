//
//  ViewController.swift
//  iBeaconDemo
//
//  Created by 許家旗 on 2016/10/19.
//  Copyright © 2016年 許家旗. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "94278BDA- B644-4520-8F0C-720EAF059935")! as UUID, identifier: "Joe")
    
    let colors = [
        1: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1),
        0: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    ]
    
    var iBeaconStatus : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        // 設定 view 的背景顏色
        self.view.backgroundColor = self.colors[0]
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedAlways) {
            
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startRangingBeacons(in: region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        let knownBeacons = beacons.filter {
            $0.proximity != CLProximity.unknown
        }
        
        if (knownBeacons.count > 0) {
            
            if (!iBeaconStatus) {
            
                let closestBeacon = knownBeacons[0] as CLBeacon
                self.view.backgroundColor = self.colors[closestBeacon.minor.intValue]
                iBeaconStatus = true
            }
        } else {
            
            if (iBeaconStatus) {
                
                self.view.backgroundColor = self.colors[0]
                iBeaconStatus = false
            }
        }
    }
}

