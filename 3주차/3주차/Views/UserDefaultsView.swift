import UIKit
import SnapKit

class UserDefaultsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setStackView()
        addViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 상단 컴포넌트들 구현
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UserDefaults 실습 뷰"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아무 텍스트나 입력해주세요"
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 14)
        
        /* 텍스트 필드 placeholder 왼쪽 여백*/
        /* 피그마에서 텍스트필드 테두리와 placeholder 왼쪽 여백의 수치가 15이므로 width: 15*/
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15, height: 0.0))
        textField.leftViewMode = .always
        
        /* 텍스트 필드 테두리 지정 */
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    public lazy var saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("UserDefaults에 저장하기", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.backgroundColor = UIColor.gray
        
        return btn
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 26
        return stackView
    }()
    
    private func setStackView() {
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(inputTextField)
        topStackView.addArrangedSubview(saveButton)
    }
    
    private func addViewConstraints() {
        self.addSubview(topStackView)
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(197)
            $0.left.equalToSuperview().offset(42)
            $0.right.equalToSuperview().offset(-42)
        }
        
        inputTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.width.equalTo(309)
        }
        
        saveButton.snp.makeConstraints{
            $0.height.equalTo(42)
            $0.width.equalTo(222)
        }
    }
    
    
}
