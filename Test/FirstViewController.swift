import UIKit

class FirstViewController: UIViewController {

    let mainLabel = UILabel()
    let backButton = UIButton(type: .custom)
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UISetUp()
    }
    
    func UISetUp() {
        view.backgroundColor = .white
        
        mainLabel.text = someString
        mainLabel.font = UIFont.boldSystemFont(ofSize: 22)
        view.addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.setTitle("뒤로가기", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = UIColor.black
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }

}
