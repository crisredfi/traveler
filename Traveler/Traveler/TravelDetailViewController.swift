//
//  TravelDetailViewController.swift
//  Traveler
//
//  Created by Aleix Segon on 19/06/2014.
//  Copyright (c) 2014 crisredfi. All rights reserved.
//

import UIKit
import MapKit
import MyCircleView




class TravelDetailViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var travelMapView : MKMapView!
    @IBOutlet var userImageView: CircleView?
    @IBOutlet var detailScrollView: UIScrollView!
    var locationManager = CLLocationManager();
    let directions = MKDirectionsRequest();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light);
        var visualEffect = UIVisualEffectView(effect: effect);
        //        visualEffect.frame = userImageView?.bounds;
        //        detailScrollView?.contentSize = CGSizeMake(320, 800);
        //        userImageView.addSubview(visualEffect);
        // Do any additional setup after loading the view.
        let status = CLLocationManager.authorizationStatus()
        
        if(status == CLAuthorizationStatus.NotDetermined) {
            locationManager.requestAlwaysAuthorization();
            locationManager.startUpdatingLocation();
            
        }
        travelMapView?.showsUserLocation = true;
        locationManager.startUpdatingLocation();
        
        
        directions.setSource(MKMapItem.mapItemForCurrentLocation());
        var location = CLLocationCoordinate2DMake(
            51.831394, -8.322030)
        let placemark = MKPlacemark(coordinate: location, addressDictionary: nil)
        let destination = MKMapItem(placemark: placemark)
        directions.setDestination(destination)
        directions.requestsAlternateRoutes = false;
        var dir = MKDirections(request: directions)
        
        
        dir.calculateDirectionsWithCompletionHandler({(response:
            MKDirectionsResponse!, error: NSError!) in
            
            if error != nil {
                // Handle error
            } else {
                self.showRoute(response)
            }
            
        })//        dir.calculateDirectionsWithCompletionHandler(MKDirectionsHandler {})
        
        
        
        //  dir.calculateDirectionsWithCompletionHandler(completionHandler:{((MKDirectionsResponse!, NSError!) -> Void) in  println("red box has faded out") })
        
    }
    
    
    func showRoute(response:MKDirectionsResponse) {
        for route:MKRoute in response.routes as [MKRoute]
        {
            travelMapView.addOverlay(route.polyline, level: MKOverlayLevel.AboveRoads)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mapView(mapView: MKMapView!, rendererForOverlay
        overlay: MKOverlay!) -> MKOverlayRenderer! {
            let renderer = MKPolylineRenderer(overlay: overlay)
            
            renderer.strokeColor = UIColor.blueColor()
            renderer.lineWidth = 5.0
            return renderer
    }
    
    
    
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
