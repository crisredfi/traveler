//
//  TravelDetailViewController.swift
//  Traveler
//
//  Created by Aleix Segon on 19/06/2014.
//  Copyright (c) 2014 crisredfi. All rights reserved.
//

import UIKit
import MapKit



class TravelDetailViewController: UIViewController , CLLocationManagerDelegate {

    @IBOutlet var travelMapView : MKMapView
    @IBOutlet var testImageView: UIImageView
    var locationManager = CLLocationManager();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light);
        var visualEffect = UIVisualEffectView(effect: effect);
        visualEffect.frame = testImageView.bounds;
        testImageView.addSubview(visualEffect);
        // Do any additional setup after loading the view.
        let status = CLLocationManager.authorizationStatus()
        
        if(status == CLAuthorizationStatus.NotDetermined) {
            locationManager.requestAlwaysAuthorization();
            locationManager.startUpdatingLocation();
            
        }
        travelMapView.showsUserLocation = true;
        locationManager.startUpdatingLocation();
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated);
//        
//
//    }
    
     func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!)
    {
        
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
