import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString
    }
    
    @IBAction func backButtonTapeed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
