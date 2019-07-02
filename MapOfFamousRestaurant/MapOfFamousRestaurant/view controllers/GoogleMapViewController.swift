import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapViewController: UIViewController {

    // MARK: - proeprties
    // 장소 서비스 모델
    var locationModel: LocationService?
    // 장소 리스트 (위도, 경도, 이름, 상세, 주소) 배열
    var locationLists: [LocationList] = []
    
    // 별점 서비스 모델
    var ratingModel: RatingService?
    
    // 별점 배열
    var ratingArray: [Double] = []
    
    // 마커 배열
    var marker: [GMSMarker] = []
    
    // 현재 위치
    let currentMarker = GMSMarker()
    
    // Google Map을 현재 view에 띄우기
    // 메가존 좌표 : 37.498508, 127.034222
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: GMSCameraPosition.camera(withLatitude: 37.498508, longitude: 127.034222, zoom: 15.0))

    // MARK: - life cycle
    // 뷰가 보이기 직전에 호출되는 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // 현재 위치
        view = mapView
        // 메가존 좌표: 37.498508, 127.034222
        self.currentMarker.position = CLLocationCoordinate2D(latitude: 37.498508, longitude: 127.034222)
        self.currentMarker.title = "megazone"
        self.currentMarker.snippet = "Korea"
        self.currentMarker.icon = GMSMarker.markerImage(with: .gray)
        self.currentMarker.map = mapView
        
        // 델리게이트
        mapView.delegate = self
        
        // network
        // 별점 서비스 대입
        ratingModel = RatingService()
        
        // 장소 서비스 대입
        locationModel = LocationService()
        
        getLocation()
        view.reloadInputViews()
    }
    
    // MARK: Methods
    
    func getLocation() {
        
    }
    
    func setMakerColor(rating: Double, index: Int) {
        if rating == 5 {
            self.marker[index].icon = GMSMarker.markerImage(with: .red)
        }
        if rating >= 4 && rating < 5 {
            self.marker[index].icon = GMSMarker.markerImage(with: .yellow)
        }
        if rating >= 3 && rating < 4 {
            self.marker[index].icon = GMSMarker.markerImage(with: .blue)
        }
        if rating >= 0 && rating < 3 {
            self.marker[index].icon = GMSMarker.markerImage(with: .lightGray)
        }
    }
}

extension GoogleMapViewController: GMSMapViewDelegate {
    
    // marker를 눌렀을 때 나오는 윈도우를 탭 했을 때 - 디테일 화면으로 이동
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController: DetailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
        
        let id = Int(marker.zIndex) + 1
        viewController.locationId = id
        viewController.name = marker.title ?? ""
        viewController.rating = ratingArray[id - 1]
//        viewController.address = locationLists[id - 1].address ?? ""
        
        self.present(viewController, animated: true)
    }
}
