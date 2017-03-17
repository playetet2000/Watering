//
//  ViewController.swift
//  Watering
//
//  Created by Chiu Nick on 13/3/2017.
//  Copyright © 2017 Chiu Nick. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager!
    
    @IBAction func onViewTapped(_ sender: UIButton) {
       
        if view.backgroundColor == UIColor.red{
            wateringPlant(state: "ON")
            view.backgroundColor = UIColor.green
        }
        else{
            wateringPlant(state: "OFF")
            view.backgroundColor = UIColor.red
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        wateringPlant(state: "OFF")
        view.backgroundColor = UIColor.red
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wateringPlant(state:String){
        let ref = FIRDatabase.database().reference()
        let post : [String: AnyObject] = ["state": state as AnyObject]
        ref.child("Water").setValue(post)
    }
    
    
}
