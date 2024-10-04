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
        
        if #available(iOS 13.0, *) {
            textField.overrideUserInterfaceStyle = .light
        }
        
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
        // 이메일 변경 버튼에 액션 추가
        changeEmailButton.addTarget(self, action: #selector(handleChangeEmail), for: .touchUpInside)
        // 비밀번호 변경 버튼에 액션 추가
        changePasswordButton.addTarget(self, action: #selector(handleChangePassword), for: .touchUpInside)
    }
    
    @objc func handleChangeEmail() {
        print("handleChangeEmail called")  // 디버깅용
        if isEmailEditable {
            emailTextField.isUserInteractionEnabled = false
            changeEmailButton.setTitle("변경", for: .normal)
        } else {
            emailTextField.isUserInteractionEnabled = true
            changeEmailButton.setTitle("확인", for: .normal)
        }
        isEmailEditable.toggle()
        print("isEmailEditable: \(isEmailEditable)")
    }
    
    @objc func handleChangePassword() {
        print("handleChangePassword called")  // 디버깅용
        if isPasswordEditable {
            passwordTextField.isUserInteractionEnabled = false
            changePasswordButton.setTitle("변경", for: .normal)
        } else {
            passwordTextField.isUserInteractionEnabled = true
            changePasswordButton.setTitle("확인", for: .normal)
        }
        isPasswordEditable.toggle()
        print("isPasswordEditable: \(isPasswordEditable)")
    }
}
