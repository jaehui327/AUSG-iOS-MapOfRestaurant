import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapViewController: UIViewController, GMSMapViewDelegate {

    // MARK: - proeprties
    // 장소 서비스 모델
    var locationModel: LocationService?
    // 장소 리스트 (위도, 경도, 이름, 상세, 주소) 배열
    var locationLists: [LocationList]?
    
    // 별점 서비스 모델
    var ratingModel: RatingService?
    // 별점 정보
    var ratingInformation: RatingInformation?
    
    // 별점 배열
    var ratingArray: [Double] = []
    
    // 마커 배열
    var marker: [GMSMarker] = []
    
    // 현재 위치
    var currentMarker = GMSMarker()

    // MARK: - life cycle
    // 뷰가 보이기 직전에 호출되는 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Google Map을 현재 view에 띄우기
        // 메가존 좌표 : 37.498508, 127.034222
        let camera = GMSCameraPosition.camera(withLatitude: 37.498508, longitude: 127.034222, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        view = mapView
        
        // network
        // 별점 서비스 대입
        ratingModel = RatingService()
        
        // 장소 서비스 대입
        locationModel = LocationService()
        // 장소 가져오기 - get location list
        locationModel?.getLocationList{ locationLists in
            // self.lactionLists에 대입
            self.locationLists = locationLists
            
            // 현재 위치
            // 메가존 좌표: 37.498508, 127.034222
            self.currentMarker.position = CLLocationCoordinate2D(latitude: 37.498508, longitude: 127.034222)
            self.currentMarker.title = "megazone"
            self.currentMarker.snippet = "Korea"
            self.currentMarker.icon = GMSMarker.markerImage(with: .gray)
            self.currentMarker.map = mapView
            
            // 장소 배열에서 장소 각각 읽어서 표시하기
            for location in self.locationLists ?? [] {
                self.marker.append(GMSMarker())
                let index = location.id - 1
                self.marker[index].position = CLLocationCoordinate2D(latitude: location.latitude ?? 0.0, longitude: location.longitude ?? 0.0)
                self.marker[index].title = location.name
                self.marker[index].snippet = location.description
                self.marker[index].zIndex = Int32(index)
                self.setMakerColor(id: location.id)
                self.marker[index].map = mapView
            }
        }
    }
    
    func setMakerColor(id: Int) {
        ratingModel?.getRatingInformation(id: id) { ratingInformation in
            
            self.ratingInformation = ratingInformation
            let rating = self.ratingInformation?.rating ?? 0.0
            self.ratingArray.append(rating)
            
            if rating >= 0 && rating < 3 {
                self.marker[id].icon = GMSMarker.markerImage(with: .lightGray)
            } else if rating >= 3 && rating < 4 {
                self.marker[id].icon = GMSMarker.markerImage(with: .blue)
            } else if rating >= 4 && rating < 5 {
                self.marker[id].icon = GMSMarker.markerImage(with: .yellow)
            } else if rating == 5 {
                self.marker[id].icon = GMSMarker.markerImage(with: .red)
            }
        }
    }

    // marker를 눌렀을 때 나오는 윈도우를 탭 했을 때 - 디테일 화면으로 이동
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController: DetailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
        let id = Int(marker.zIndex) + 1
        viewController.id = id
        viewController.name = marker.title ?? ""
        viewController.rating = ratingArray[id]
        viewController.address = locationLists?[id].address ?? ""
        self.present(viewController, animated: true)
    }
}
