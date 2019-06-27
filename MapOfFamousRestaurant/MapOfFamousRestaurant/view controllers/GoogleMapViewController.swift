//
//  GoogleMapViewController.swift
//  MapOfFamousRestaurant
//
//  Created by JHKim on 27/06/2019.
//  Copyright © 2019 JHKim. All rights reserved.
// 메가존 좌표: 37.498508, 127.034222

import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapViewController: UIViewController, GMSMapViewDelegate {

    var starRating: Int = 0
    
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: 37.498508, longitude: 127.034222, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        view = mapView
        
        // Creates a marker in the center of the map.
        marker.position = CLLocationCoordinate2D(latitude: 37.498508, longitude: 127.034222)
        marker.title = "megazone"
        marker.snippet = "Korea"
        setMakerColor()
        marker.map = mapView
    }
    
    func setMakerColor() {
        if starRating ?? 0 >= 0 && starRating ?? 0 <= 2 { marker.icon = GMSMarker.markerImage(with: .lightGray) }
        else if starRating ?? 0 == 3 { marker.icon = GMSMarker.markerImage(with: .blue) }
        else if starRating ?? 0 == 4 { marker.icon = GMSMarker.markerImage(with: .yellow) }
        else if starRating ?? 0 == 5 { marker.icon = GMSMarker.markerImage(with: .red) }
    }

    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Detail")
        self.present(viewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
