import UIKit

class AddRestaurantViewController: UIViewController {
    
    // MARK: - properties
    // 장소 서비스 모델
    var locaionModel: LocationService?
    
    // MARK: - IBOutlet
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: - IBAction
    // 장소 등록 버튼 탭 했을 때 - post
    @IBAction func tappedSend(_ sender: Any) {
        // textfield 값 Double형으로 변환
        guard let longitude = NumberFormatter().number(from: longitudeTextField.text ?? "")?.doubleValue else { return }
        guard let latitude = NumberFormatter().number(from: latitudeTextField.text ?? "")?.doubleValue else { return }
        
        // network
        locaionModel?.postLocationInformation(longitude: longitude, latitude: latitude, name: nameTextField.text ?? "", description: descriptionTextField.text ?? "", address: addressTextField.text ?? "") { locationList in
            // 전송 완료 log
            print("postLocationIformation success - longitude : \(longitude), latitude: \(latitude), name: \(String(describing: self.nameTextField.text)), description: \(String(describing: self.descriptionTextField.text)), address: \(String(describing: self.addressTextField.text))")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // 장소 모델 대입
        locaionModel = LocationService()
        
        //빈화면 탭했을 때 제스처 추가
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTapped(_:)))
        view.addGestureRecognizer(tap)
    }

}

extension AddRestaurantViewController: UITextFieldDelegate {
    //빈 화면 탭했을 때 키보드 내리기
    @objc func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
