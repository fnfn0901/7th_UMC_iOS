import UIKit

class LoginViewController: UIViewController {

    override func loadView() {
        self.view = LoginView()  // LoginView를 커스텀 뷰로 설정
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let loginView = self.view as? LoginView {
            // 로그인 버튼에 액션 추가
            loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        }
    }
    
    @objc func didTapLoginButton() {
        // MainTabBarController로 모달 전환
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: true, completion: nil)
    }
}
