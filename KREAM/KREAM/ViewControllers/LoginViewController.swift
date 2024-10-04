import UIKit

class LoginViewController: UIViewController {

    override func loadView() {
        self.view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let loginView = self.view as? LoginView {
            // 로그인 버튼에 액션 추가
            loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

            // UserDefaults에서 저장된 값 불러오기
            if let savedUser = User.loadFromUserDefaults() {
                loginView.emailTextField.text = savedUser.id
                loginView.passwordTextField.text = savedUser.pwd
            } else {
                print("No saved user data found.")
            }
        }
    }
    
    @objc func didTapLoginButton() {
        if let loginView = self.view as? LoginView {
            let id = loginView.emailTextField.text ?? ""
            let pwd = loginView.passwordTextField.text ?? ""
            
            // 빈 값 확인
            if id.isEmpty || pwd.isEmpty {
                print("ID 또는 비밀번호가 입력되지 않았습니다.")
                return
            }
            
            // 로그인 정보 저장
            let user = User(id: id, pwd: pwd)
            user.saveToUserDefaults()

            // MainTabBarController로 모달 전환
            let mainTabBarController = MainTabBarController()
            mainTabBarController.modalPresentationStyle = .fullScreen
            present(mainTabBarController, animated: true, completion: nil)
        }
    }
}
