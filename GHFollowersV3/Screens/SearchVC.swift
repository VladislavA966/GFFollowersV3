import UIKit

class SearchVC: UIViewController {
    
    
    let logoImageView = UIImageView()
    let searchTextField = GFTextField()
    let searchButton = GFButon(backgroundColor: .systemGreen, title: "Get Followers")
    var isUserNameEntered: Bool {
        searchTextField.text?.isEmpty ?? false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setUpImageView()
        setUpTextField()
        setUpSearchButton()
        createDismissKeyboardWhenTappedAround()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setUpImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    private func setUpTextField() {
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Enter a user name"
        searchTextField.borderStyle = .roundedRect
        searchTextField.returnKeyType = .go
        
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func createDismissKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func setUpSearchButton() {
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(pushToFollowersListVS), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
   @objc private func pushToFollowersListVS() {
       print("PUSH BUTTON TAP")
       guard !isUserNameEntered else {
           showAlert(title: "Empty user name", message: "Please enter user name we need to now who are his followers", buttonTitle: "Ok")
           return
       }
       let followersListVC = FollowerListVC()
       followersListVC.userName = searchTextField.text
       followersListVC.title = searchTextField.text
       navigationController?.pushViewController(followersListVC, animated: true)
    }
}
