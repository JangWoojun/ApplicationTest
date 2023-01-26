import UIKit

final class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetUp()
    }
    
    func UISetUp() {
        

    }
    // 코드로
    @IBAction func Button1(_ sender: UIButton) {
        let firstVC = FirstViewController()
         firstVC.modalPresentationStyle = .fullScreen
        firstVC.someString = "값 전달1"
        present(firstVC, animated: true)
    }
    // 코드로 스토리 보드 객체 생성하여
    @IBAction func Button2(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else {
            return
        }
        secondVC.someString = "값 전달2"
        present(secondVC, animated: true)
    }
    // 스토리보드에서 (간접 세그웨이)
    @IBAction func Button3(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC =  segue.destination as! ThirdViewController
            thirdVC.someString = "값 전달3"
        } else if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "값 전달4"
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 직ㄱ접 세그웨이 구현 방식에서만 사용 가능
        if true { // 조건에 따라 이동할지 결정
            return true
        }
    }
}
