//
//  GoogleMapViewController.swift
//  MapOfFamousRestaurant
//
//  Created by JHKim on 27/06/2019.
//  Copyright © 2019 JHKim. All rights reserved.

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
        
        // Google Map
        let camera = GMSCameraPosition.camera(withLatitude: 37.498508, longitude: 127.034222, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        view = mapView
        
        // network
        ratingModel = RatingService()
        
        locationModel = LocationService()
        locationModel?.getLocationList{ locationLists in
            self.locationLists = locationLists
            
            // 현재 위치
            // 메가존 좌표: 37.498508, 127.034222
            self.marker.append(GMSMarker())
            self.marker[0].position = CLLocationCoordinate2D(latitude: 37.498508, longitude: 127.034222)
            self.marker[0].title = "megazone"
            self.marker[0].snippet = "Korea"
            self.marker[0].icon = GMSMarker.markerImage(with: .gray)
            self.marker[0].map = mapView
            
            for location in self.locationLists ?? [] {
                self.marker.append(GMSMarker())
                self.marker[location.id].position = CLLocationCoordinate2D(latitude: location.latitude ?? 0.0, longitude: location.longitude ?? 0.0)
                self.marker[location.id].title = location.name
                self.marker[location.id].snippet = location.description
                self.setMakerColor(id: location.id)
                self.marker[location.id].zIndex = Int32(location.id)
                self.marker[location.id].map = mapView
            }
        }
    }
    
    func setMakerColor(id: Int) {
        ratingModel?.getRatingInformation(id: id) { ratingInformation in
            if ratingInformation.rating >= 0 && ratingInformation.rating < 3 { self.marker[id].icon = GMSMarker.markerImage(with: .lightGray) }
            else if ratingInformation.rating >= 3 && ratingInformation.rating < 4 { self.marker[id].icon = GMSMarker.markerImage(with: .blue) }
            else if ratingInformation.rating >= 4 && ratingInformation.rating < 5 { self.marker[id].icon = GMSMarker.markerImage(with: .yellow) }
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
