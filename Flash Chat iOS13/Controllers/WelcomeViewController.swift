
import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        let titleText = K.appName // CLTypingLabel animation works once .text has been initialized
    
      
        // Manual animation
        var charIndex = 0.0
        for letter in titleText {
            // Without multiplying charIndex, which increments each loop
            // Timer.scheduledTimer for each letter will run almost at the same time
            // Need to allow increment of 1 for charIndex to give delay per each interval
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }

        
    }
    

}
