import UIKit

class FollowerListVC: UIViewController {

    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.fetchFollowers(for: userName, page: 1) {
            (followers, error) in

            guard let followers = followers else {
                self.showAlert(
                    title: "Sheet happend",
                    message: error!,
                    buttonTitle: "Ok"
                )
                return
            }

            print("Followers count = \(followers.count)")
            
            

        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
