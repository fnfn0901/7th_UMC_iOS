import UIKit

class LoginViewController: UIViewController {

    override func loadView() {
        self.view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let loginView = self.view as? LoginView {
            loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        }
    }
    
    @objc func didTapLoginButton() {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: true, completion: nil)
    }
}
