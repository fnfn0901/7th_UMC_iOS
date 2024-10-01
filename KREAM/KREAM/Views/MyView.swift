import UIKit
import SnapKit

class MyView: UIView {
    
    // 상단 버튼 모음
    let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "setting_button"), for: .normal)
        return button
    }()
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "camera_button"), for: .normal)
        return button
    }()
    
    // 프로필 이미지
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image") // 이미지 파일을 여기에 추가해야 함
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 45 // 90x90 이미지에서 둥근 모서리 적용
        return imageView
    }()
    
    // 프로필 텍스트 (닉네임과 팔로워/팔로잉)
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont(name: "Pretendard", size: 16)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326"
        label.font = UIFont(name: "Pretendard", size: 12)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.font = UIFont(name: "Pretendard", size: 12)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // 프로필 버튼 모음
    let manageProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        // 공통 스타일 적용
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 9)
        button.titleLabel?.textAlignment = .center
        
        button.layer.borderColor = UIColor(white: 0.835, alpha: 1.0).cgColor
        button.layer.borderWidth = 0.8
        button.layer.cornerRadius = 8
        return button
    }()

    let shareProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        // 공통 스타일 적용
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 9)
        button.titleLabel?.textAlignment = .center
        
        button.layer.borderColor = UIColor(white: 0.835, alpha: 1.0).cgColor
        button.layer.borderWidth = 0.8
        button.layer.cornerRadius = 8
        return button
    }()
    // 상단 컴포넌트 그룹
    let topComponentGroup = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // 배경색 설정
        backgroundColor = .white
        
        // 상단 컴포넌트 그룹 설정
        addSubview(topComponentGroup)
        
        // 상단 컴포넌트 그룹에 상단 버튼 모음 추가
        topComponentGroup.addSubview(settingsButton)
        topComponentGroup.addSubview(cameraButton)
        
        // 상단 버튼 모음 레이아웃 설정
        topComponentGroup.snp.makeConstraints { make in
            make.width.equalTo(328)  // 고정된 너비 328px
            make.height.equalTo(193).priority(.low) // Hug contents
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()  // 화면 중앙에 위치하도록 설정
        }
        
        settingsButton.snp.makeConstraints { make in
            make.size.equalTo(25)
            make.left.equalToSuperview()
        }
        
        cameraButton.snp.makeConstraints { make in
            make.size.equalTo(25)
            make.right.equalToSuperview()
        }
        
        // 프로필 프레임 추가
        topComponentGroup.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(90)
            make.left.equalToSuperview()
            make.top.equalTo(settingsButton.snp.bottom).offset(26)  // 26px 간격 추가
        }
        
        // 프로필 텍스트 추가
        topComponentGroup.addSubview(profileNameLabel)
        profileNameLabel.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(16)
            make.top.equalTo(profileImageView).offset(21)
        }
        
        // 팔로워/팔로잉 리스트 가로로 배치
        let followerFollowingStack = UIStackView(arrangedSubviews: [followerLabel, followingLabel])
        followerFollowingStack.axis = .horizontal
        followerFollowingStack.spacing = 8
        followerFollowingStack.distribution = .equalSpacing
        
        topComponentGroup.addSubview(followerFollowingStack)
        followerFollowingStack.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(16)
            make.top.equalTo(profileNameLabel.snp.bottom).offset(6)
        }
        
        // 프로필 버튼 모음 추가 (프로필 프레임으로부터 26px 간격 유지)
        let buttonStack = UIStackView(arrangedSubviews: [manageProfileButton, shareProfileButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 14  // 두 버튼 사이의 간격 14px
        
        topComponentGroup.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(26)  // 26px 간격 추가
        }
        
        // 프로필 관리 버튼 레이아웃
        manageProfileButton.snp.makeConstraints { make in
            make.width.equalTo(157)  // 고정된 너비
            make.height.equalTo(26)  // 고정된 높이
        }
        
        // 프로필 공유 버튼 레이아웃
        shareProfileButton.snp.makeConstraints { make in
            make.width.equalTo(157)  // 고정된 너비
            make.height.equalTo(26)  // 고정된 높이
        }
    }
}
