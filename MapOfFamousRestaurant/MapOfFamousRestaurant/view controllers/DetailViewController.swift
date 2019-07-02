import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - properties
    // 장소 아이디
    var locationId = 0
    // 장소 이름
    var name = ""
    // 별점
    var rating = 0.0
    // 주소
    var address = ""
    
    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: - IBAction
    // 별점 주기 눌렀을 때 - 별점 주는 화면으로 이동
    @IBAction func tappedRating(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController: SetStarViewController = storyboard.instantiateViewController(withIdentifier: "SetStar") as? SetStarViewController else { return }
        
        // 다음 화면으로 주소 ID 값 넘기기
        viewController.locationId = self.locationId
        
        weak var pvc = self.presentingViewController
        
        self.dismiss(animated: false) {
            pvc?.present(viewController, animated: true)
            }
    }
    
    // 닫기
    @IBAction func tappedClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // 이전 화면에서 받아온 값 보여주기
        nameLabel.text = name
        ratingLabel.text = String(rating)
        addressLabel.text = address
        
    }
}
