import UIKit

class LoginView: UIView {
    
    // 로고 이미지뷰
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo") // 로고 이미지
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // 이메일 라벨
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont(name: "Inter", size: 12)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 이메일 입력란
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) kream@kream.co.kr"
        textField.font = UIFont(name: "Inter", size: 12)
        textField.textColor = .gray
        textField.borderStyle = .none
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0)) // 좌측 여백
        textField.leftViewMode = .always
        textField.heightAnchor.constraint(equalToConstant: 34).isActive = true // 높이 설정
        return textField
    }()
    
    // 비밀번호 라벨
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont(name: "Inter", size: 12)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 비밀번호 입력란
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Inter", size: 12)
        textField.textColor = .gray
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0)) // 좌측 여백
        textField.leftViewMode = .always
        textField.heightAnchor.constraint(equalToConstant: 34).isActive = true // 높이 설정
        return textField
    }()
    
    // 로그인 버튼
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(white: 0.85, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 카카오 로그인 버튼
    let kakaoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오 로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 13)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // SVG 이미지 추가
        let kakaoImageView = UIImageView(image: UIImage(named: "kakao_login"))
        kakaoImageView.contentMode = .scaleAspectFit
        kakaoImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(kakaoImageView)

        // SVG 이미지 오토레이아웃 설정
        NSLayoutConstraint.activate([
            kakaoImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 17),
            kakaoImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            kakaoImageView.widthAnchor.constraint(equalToConstant: 20),
            kakaoImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        return button
    }()
    
    // 애플 로그인 버튼
    let appleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apple 로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 13)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // SVG 이미지 추가
        let appleImageView = UIImageView(image: UIImage(named: "apple_login"))
        appleImageView.contentMode = .scaleAspectFit
        appleImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(appleImageView)

        // SVG 이미지 오토레이아웃 설정
        NSLayoutConstraint.activate([
            appleImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 17),
            appleImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            appleImageView.widthAnchor.constraint(equalToConstant: 20),
            appleImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        return button
    }()
    
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // 뷰 설정 및 오토레이아웃 적용
    private func setupView() {
        backgroundColor = .white
        
        // 뷰에 추가
        addSubview(logoImageView)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(kakaoButton)
        addSubview(appleButton)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            // 로고 이미지뷰 오토레이아웃
            logoImageView.widthAnchor.constraint(equalToConstant: 287),
            logoImageView.heightAnchor.constraint(equalToConstant: 75),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 126),

            // 이메일 라벨
            emailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 288),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            
            // 이메일 입력란
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            
            // 비밀번호 라벨
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            passwordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            
            // 비밀번호 입력란
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            
            // 로그인 버튼
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
       
            // 카카오 로그인 버튼
            kakaoButton.topAnchor.constraint(equalTo: topAnchor, constant: 561),
            kakaoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47.5),
            kakaoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -47.5),
            kakaoButton.heightAnchor.constraint(equalToConstant: 40),
            
            // 애플 로그인 버튼
            appleButton.topAnchor.constraint(equalTo: topAnchor, constant: 623),
            appleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47.5),
            appleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -47.5),
            appleButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
