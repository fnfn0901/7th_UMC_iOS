import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // UIWindow 생성 및 크기 설정
        window = UIWindow(windowScene: windowScene)
        window?.frame = UIScreen.main.bounds

        // LoginViewController를 루트 뷰 컨트롤러로 설정
        let loginViewController = BaseViewController()
        window?.rootViewController = loginViewController

        // 화면에 보이게 설정
        window?.makeKeyAndVisible()
    }
}
