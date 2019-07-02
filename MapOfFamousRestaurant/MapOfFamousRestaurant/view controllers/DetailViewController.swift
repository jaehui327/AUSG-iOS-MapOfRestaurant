import UIKit

class DetailViewController: UIViewController {
    
    var id = 0
    var name = ""
    var rating = 0.0
    var address = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBAction func tappedRating(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController: SetStarViewController = storyboard.instantiateViewController(withIdentifier: "SetStar") as? SetStarViewController else { return }
        
        weak var pvc = self.presentingViewController
        viewController.id = self.id
        self.dismiss(animated: false) {
            pvc?.present(viewController, animated: true)
            }
    }
    
    @IBAction func tappedClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        nameLabel.text = name
        ratingLabel.text = String(rating)
        addressLabel.text = address
        
    }
}
