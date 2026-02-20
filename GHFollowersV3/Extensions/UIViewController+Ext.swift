
import UIKit



extension UIViewController {
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = GFAllertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alert.modalTransitionStyle = .crossDissolve
            alert.modalPresentationStyle = .overFullScreen
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
