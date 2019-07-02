import UIKit

class SetStarViewController: UIViewController {
    
    // MARK: - properties
    // 별점 서비스 모델
    var ratingModel: RatingService?
    // 주소 아이디 (이전 화면에서 받아오기)
    var locationId = 0
    // 화면에서 선택된 별 개수
    var starNum = 0
    
    // MARK: - IBOutlet
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: - IBAction
    
    // 전송 버튼 클릭 시 별점 post
    @IBAction func sendRating(_ sender: Any) {
        
    }
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // 별점 서비스 대입
        ratingModel = RatingService()
        
        // 각 이미지 뷰에 동작 허용하도록 설정
        star1.isUserInteractionEnabled = true
        star2.isUserInteractionEnabled = true
        star3.isUserInteractionEnabled = true
        star4.isUserInteractionEnabled = true
        star5.isUserInteractionEnabled = true
        // 제스처 각각
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        // 이미지 뷰에 제스쳐 주가
        star1.addGestureRecognizer(gesture1)
        star2.addGestureRecognizer(gesture2)
        star3.addGestureRecognizer(gesture3)
        star4.addGestureRecognizer(gesture4)
        star5.addGestureRecognizer(gesture5)
    }
    
    // MARK: - Methods
    // 이미지 뷰 선택되었을 때
    @objc private func tappedStar(_ sender: UITapGestureRecognizer) {
        // 각 이미지 뷰의 태그를 점수로
        starNum = sender.view?.tag ?? 0
        print("@objc tappedStar : \(starNum)")
        fillStar()
    }
    
    // 화면에 표시하기
    func fillStar() {
        if starNum == 1 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "empty_star")
            star3.image = UIImage(named: "empty_star")
            star4.image = UIImage(named: "empty_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 2 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "empty_star")
            star4.image = UIImage(named: "empty_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 3 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "full_star")
            star4.image = UIImage(named: "empty_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 4 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "full_star")
            star4.image = UIImage(named: "full_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 5 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "full_star")
            star4.image = UIImage(named: "full_star")
            star5.image = UIImage(named: "full_star")
        }
    }
}
