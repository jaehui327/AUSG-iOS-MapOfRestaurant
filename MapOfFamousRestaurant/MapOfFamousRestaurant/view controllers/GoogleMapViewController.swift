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

    var locationModel: LocationService?
    var locationLists: [LocationList]?
    
    var ratingModel: RatingService?
    var ratingInformation: RatingInformation?
    
    var marker: [GMSMarker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // network
        locationModel = LocationService()
        locationModel?.getLocationList{ locationLists in
            self.locationLists = locationLists
        }
        
        ratingModel = RatingService()
        
        // Google Map
        let camera = GMSCameraPosition.camera(withLatitude: 37.498508, longitude: 127.034222, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        view = mapView
        
        for location in locationLists ?? [] {
            marker[location.id] = GMSMarker()
            marker[location.id].position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            marker[location.id].title = location.name
            marker[location.id].snippet = location.description
            setMakerColor(id: location.id)
            marker[location.id].zIndex = Int32(location.id)
            marker[location.id].map = mapView
        }
    }
    
    func setMakerColor(id: Int) {
        ratingModel?.getRatingInformation(id: id) { ratingInformation in
            if ratingInformation.rating >= 0 && ratingInformation.rating <= 2 { self.marker[id].icon = GMSMarker.markerImage(with: .lightGray) }
            else if ratingInformation.rating == 3 { self.marker[id].icon = GMSMarker.markerImage(with: .blue) }
            else if ratingInformation.rating == 4 { self.marker[id].icon = GMSMarker.markerImage(with: .yellow) }
            else if ratingInformation.rating == 5 { self.marker[id].icon = GMSMarker.markerImage(with: .red) }
        }
        
    }

    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController: DetailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
        let id = Int(marker.zIndex)
        viewController.id = id
        viewController.name = locationLists?[id].name ?? ""
        viewController.descriptions = locationLists?[id].description ?? ""
        viewController.address = locationLists?[id].address ?? ""
        self.present(viewController, animated: true)
    }
}
