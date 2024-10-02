import UIKit

class ProfileSettingView: UIView {
    
    var isEmailEditable = false
    var isPasswordEditable = false
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftPaddingPoints(11)
        
        // 사용자 인터페이스 스타일 강제 설정
        if #available(iOS 13.0, *) {
            textField.overrideUserInterfaceStyle = .light
        }
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "example@naver.com",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        
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
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftPaddingPoints(11)

        // 사용자 인터페이스 스타일 강제 설정
        if #available(iOS 13.0, *) {
            textField.overrideUserInterfaceStyle = .light
        }

        // placeholder 텍스트 색상을 검정으로 설정
        textField.attributedPlaceholder = NSAttributedString(
            string: "******************",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        
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
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupActions()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(profileImageView)
        addSubview(profileInfoLabel)
        addSubview(emailTextField)
        addSubview(changeEmailButton)
        addSubview(passwordTextField)
        addSubview(changePasswordButton)
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 52),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            
            profileInfoLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            profileInfoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            
            emailTextField.topAnchor.constraint(equalTo: profileInfoLabel.bottomAnchor, constant: 26),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            emailTextField.trailingAnchor.constraint(equalTo: changeEmailButton.leadingAnchor, constant: -11),
            emailTextField.heightAnchor.constraint(equalToConstant: 32),
            
            changeEmailButton.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            changeEmailButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -17),
            changeEmailButton.widthAnchor.constraint(equalToConstant: 58),
            changeEmailButton.heightAnchor.constraint(equalToConstant: 32),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            passwordTextField.trailingAnchor.constraint(equalTo: changePasswordButton.leadingAnchor, constant: -11),
            passwordTextField.heightAnchor.constraint(equalToConstant: 32),
            
            changePasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            changePasswordButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -17),
            changePasswordButton.widthAnchor.constraint(equalToConstant: 58),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    private func setupActions() {
        changeEmailButton.addTarget(self, action: #selector(handleChangeEmail), for: .touchUpInside)
        changePasswordButton.addTarget(self, action: #selector(handleChangePassword), for: .touchUpInside)
    }

    @objc private func handleChangeEmail() {
        if isEmailEditable {
            emailTextField.isUserInteractionEnabled = false
            emailTextField.textColor = .black
            emailTextField.font = UIFont(name: "Pretendard", size: 14)
            emailTextField.attributedPlaceholder = NSAttributedString(
                string: "example@naver.com",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            changeEmailButton.setTitle("변경", for: .normal)
            changeEmailButton.backgroundColor = .clear
            changeEmailButton.setTitleColor(.black, for: .normal)
        } else {
            emailTextField.isUserInteractionEnabled = true
            emailTextField.textColor = .black
            emailTextField.font = UIFont.systemFont(ofSize: 14)
            emailTextField.attributedPlaceholder = NSAttributedString(
                string: "새로운 이메일을 입력해주세요!",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            changeEmailButton.setTitle("확인", for: .normal)
            changeEmailButton.setTitleColor(.black, for: .normal)
            changeEmailButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        }
        isEmailEditable.toggle()
    }

    @objc private func handleChangePassword() {
        if isPasswordEditable {
            passwordTextField.isUserInteractionEnabled = false
            passwordTextField.textColor = .black
            passwordTextField.attributedPlaceholder = NSAttributedString(
                string: "******************",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            changePasswordButton.setTitle("변경", for: .normal)
            changePasswordButton.backgroundColor = .clear
            changePasswordButton.setTitleColor(.black, for: .normal)
        } else {
            passwordTextField.isUserInteractionEnabled = true
            passwordTextField.textColor = .black
            passwordTextField.font = UIFont.systemFont(ofSize: 14)
            passwordTextField.attributedPlaceholder = NSAttributedString(
                string: "새로운 비밀번호를 입력해주세요!",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            changePasswordButton.setTitle("확인", for: .normal)
            changePasswordButton.setTitleColor(.black, for: .normal)
            changePasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        }
        isPasswordEditable.toggle()
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
