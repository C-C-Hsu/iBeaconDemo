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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

