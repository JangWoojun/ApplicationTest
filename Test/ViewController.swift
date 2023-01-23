import UIKit

class ViewController: UIViewController, UITextFieldDelegate { // 프로토
    
    @IBOutlet weak var textFleld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        textFleld.delegate = self // 대리자 선택
        
        textFleld.keyboardType = UIKeyboardType.emailAddress // 키보드 타입
        textFleld.placeholder = "이메일 입력" // 힌트 메세지
        textFleld.borderStyle = .roundedRect // 텍스트 필드 선 타입
        textFleld.clearButtonMode = .always // 클리어 버튼 여부
        textFleld.returnKeyType = .done // 엔터 버튼 바꾸기
        textFleld.becomeFirstResponder() // 첫번째 응답객체로 만들기
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textFleld.resignFirstResponder() // 응답 객체를 사임
    }
    
    // 텍스트 필트 입력을 허락할건지 여부
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 입력을 시작한 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        view.backgroundColor = .black
    }
    
    // 클리어 버튼 허락 여부
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드내에서 내용이 변경될 때마다 호출됨 (허락할 지 여부)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        if (textField.text?.count)! + string.count > 10 {
            return false
        } else {
            return true
        }
    }
    
    // 엔터키가 눌러졌을 때 다음동작을 허락할 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        view.backgroundColor = .opaqueSeparator
        return true
    }
    
    // 텍스트 필드에 입력이 끝날 때 호출되어서 허락 여부를 판단
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드에 입력이 실제 끝났을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        view.backgroundColor = .white
    }
    
    // 다른 곳 터치 시 키보드 종료
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
//        textFleld.resignFirstResponder()
    }
    
}

