import UIKit
import SnapKit

class MyView: UIView {
    
    // 레이블 선언
    let label: UILabel = {
        let label = UILabel()
        label.text = "마이 페이지"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
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
        // 배경색 설정
        backgroundColor = .white
        
        // 레이블을 뷰에 추가
        addSubview(label)
        
        // SnapKit을 사용하여 중앙에 레이블 배치
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
