import UIKit

class ProfileSettingView: UIView {
    
    // 프로필 이미지
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 45 // 반원 형태
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 프로필 정보 그룹
    let profileInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont(name: "Pretendard", size: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@naver.com"
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.font = UIFont(name: "Pretendard", size: 14)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftPaddingPoints(11) // 왼쪽 11만큼 패딩 추가
        return textField
    }()
    
    let changeEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "******************"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.font = UIFont(name: "Pretendard", size: 14)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftPaddingPoints(11) // 왼쪽 11만큼 패딩 추가
        return textField
    }()
    
    let changePasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        addSubview(profileImageView)
        addSubview(profileInfoLabel)
        addSubview(emailTextField)
        addSubview(changeEmailButton)
        addSubview(passwordTextField)
        addSubview(changePasswordButton)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            // Profile Image View
            profileImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 52),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            
            // Profile Info Label
            profileInfoLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            profileInfoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            
            // Email Text Field
            emailTextField.topAnchor.constraint(equalTo: profileInfoLabel.bottomAnchor, constant: 26),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            emailTextField.trailingAnchor.constraint(equalTo: changeEmailButton.leadingAnchor, constant: -11),
            emailTextField.heightAnchor.constraint(equalToConstant: 32),
            
            // Change Email Button
            changeEmailButton.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            changeEmailButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -17),
            changeEmailButton.widthAnchor.constraint(equalToConstant: 58),
            changeEmailButton.heightAnchor.constraint(equalToConstant: 32),
            
            // Password Text Field
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            passwordTextField.trailingAnchor.constraint(equalTo: changePasswordButton.leadingAnchor, constant: -11),
            passwordTextField.heightAnchor.constraint(equalToConstant: 32),
            
            // Change Password Button
            changePasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            changePasswordButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -17),
            changePasswordButton.widthAnchor.constraint(equalToConstant: 58),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
