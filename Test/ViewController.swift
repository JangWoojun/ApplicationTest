import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    var time = 0
    weak var timer: Timer?
    
    let id: [SystemSoundID] = Array(1000...4000).map {SystemSoundID($0)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.black.cgColor
        startButton.isEnabled = false
    }

    func audioSound() {
        for i in id {
            AudioServicesPlayAlertSound(i)
        }
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        time = Int(sender.value * 60.0)
        timeLabel.text = "\(time)초"
        startButton.isEnabled = true
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] _ in
            if time > 0 {
                time -= 1
                timeLabel.text = "\(time)초"
                slider.setValue(Float(time) / 60.0, animated: true)
            } else {
                timer?.invalidate()
                timeLabel.text = "종료"
                audioSound()
                startButton.isEnabled = false
            }
        })
    }

    @IBAction func resetButtonTapeed(_ sender: UIButton) {
        time = 0
        timer?.invalidate()
        slider.setValue(0.5, animated: true)
        timeLabel.text = "초를 선택해주세요"
        startButton.isEnabled = false
    }
    
}

