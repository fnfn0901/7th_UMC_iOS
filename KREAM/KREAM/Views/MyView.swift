import UIKit
import SnapKit

class MyView: UIView {
    
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
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    
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
    
    let manageProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
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
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 9)
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor(white: 0.835, alpha: 1.0).cgColor
        button.layer.borderWidth = 0.8
        button.layer.cornerRadius = 8
        return button
    }()
    
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
        backgroundColor = .white
        
        addSubview(topComponentGroup)
        topComponentGroup.addSubview(settingsButton)
        topComponentGroup.addSubview(cameraButton)
        
        topComponentGroup.snp.makeConstraints { make in
            make.width.equalTo(328)
            make.height.equalTo(193).priority(.low)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
        }
        
        settingsButton.snp.makeConstraints { make in
            make.size.equalTo(25)
            make.left.equalToSuperview()
        }
        
        cameraButton.snp.makeConstraints { make in
            make.size.equalTo(25)
            make.right.equalToSuperview()
        }
        
        topComponentGroup.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(90)
            make.left.equalToSuperview()
            make.top.equalTo(settingsButton.snp.bottom).offset(26)
        }
        
        topComponentGroup.addSubview(profileNameLabel)
        profileNameLabel.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(16)
            make.top.equalTo(profileImageView).offset(21)
        }
        
        let followerFollowingStack = UIStackView(arrangedSubviews: [followerLabel, followingLabel])
        followerFollowingStack.axis = .horizontal
        followerFollowingStack.spacing = 8
        followerFollowingStack.distribution = .equalSpacing
        
        topComponentGroup.addSubview(followerFollowingStack)
        followerFollowingStack.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(16)
            make.top.equalTo(profileNameLabel.snp.bottom).offset(6)
        }
        
        let buttonStack = UIStackView(arrangedSubviews: [manageProfileButton, shareProfileButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 14
        
        topComponentGroup.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(26)
        }
        
        manageProfileButton.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        shareProfileButton.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
}
