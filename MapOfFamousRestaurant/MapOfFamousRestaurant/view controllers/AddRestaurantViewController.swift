import UIKit

class AddRestaurantViewController: UIViewController {
    
    var locaionModel: LocationService?
    
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func tappedSend(_ sender: Any) {
        guard let longitude = NumberFormatter().number(from: longitudeTextField.text ?? "")?.doubleValue else { return }
        guard let latitude = NumberFormatter().number(from: latitudeTextField.text ?? "")?.doubleValue else { return }
        locaionModel?.postLocationInformation(longitude: longitude, latitude: latitude, name: nameTextField.text ?? "", description: descriptionTextField.text ?? "", address: addressTextField.text ?? "") { locationList in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
