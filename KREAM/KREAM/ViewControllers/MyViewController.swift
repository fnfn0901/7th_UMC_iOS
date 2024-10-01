import UIKit

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
        
        // 프로필 관리 버튼에 액션 추가
        myView.manageProfileButton.addTarget(self, action: #selector(navigateToProfileManage), for: .touchUpInside)
    }
    
    // 프로필 관리 페이지로 이동하는 함수
    @objc func navigateToProfileManage() {
        // navigationController가 nil이 아닌지 확인
        if let navigationController = self.navigationController {
            let profileManageVC = ProfileSettingViewController()
            navigationController.pushViewController(profileManageVC, animated: true)
        } else {
            print("navigationController가 nil입니다.")
        }
    }
}
