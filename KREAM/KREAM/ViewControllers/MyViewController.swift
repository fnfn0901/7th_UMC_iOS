import UIKit
import SnapKit

class MyViewController: UIViewController {

    // MyView 인스턴스 생성
    let myView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MyView를 뷰에 추가
        view.addSubview(myView)
        
        // MyView 레이아웃 설정
        myView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // MyView가 전체 화면을 채우도록 설정
        }
        
        // ProfileSettingViewController로 화면 전환하는 액션 추가
        myView.manageProfileButton.addTarget(self, action: #selector(goToProfileSettings), for: .touchUpInside)
    }

    @objc func goToProfileSettings() {
        // ProfileSettingViewController로 네비게이션 전환
        let profileSettingVC = ProfileSettingViewController()
        self.navigationController?.pushViewController(profileSettingVC, animated: true)
    }
}
