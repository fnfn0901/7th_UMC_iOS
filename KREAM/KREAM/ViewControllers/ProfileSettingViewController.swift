import UIKit

class ProfileSettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // ProfileSettingView를 추가
        let profileSettingView = ProfileSettingView()
        profileSettingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileSettingView)
        
        // Safe Area를 고려한 레이아웃 설정
        NSLayoutConstraint.activate([
            profileSettingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileSettingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileSettingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileSettingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setupNavigationBar()
    }
    
    // 네비게이션 바 설정
    private func setupNavigationBar() {
        // 네비게이션 바의 배경색 설정
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        // 'back_button' 이미지를 커스텀 back button으로 설정
        let backButtonImage = UIImage(named: "back_button")
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black // 버튼 이미지의 색을 설정
        
        // 네비게이션 아이템에 커스텀 back 버튼 추가
        navigationItem.leftBarButtonItem = backButton
        
        // '프로필 관리' 타이틀 설정
        let titleLabel = UILabel()
        titleLabel.text = "프로필 관리"
        titleLabel.font = UIFont(name: "Pretendard", size: 16)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
    }
    
    // back button의 액션 정의
    @objc private func backButtonTapped() {
        // 뒤로 가기 액션 처리
        navigationController?.popViewController(animated: true)
    }
}
