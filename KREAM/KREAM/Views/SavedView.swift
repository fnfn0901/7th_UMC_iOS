import UIKit
import SnapKit

class SavedView: UIView {
    
    // Saved 라벨
    let savedLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Pretendard-SemiBold", size: 28)
        label.textAlignment = .left
        return label
    }()
    
    // 전체 10개 라벨
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    // 테이블 뷰
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white
        addSubview(savedLabel)
        addSubview(countLabel)
        addSubview(tableView)
    }

    private func setupLayout() {
        // Saved 라벨 오토레이아웃 (상단 16, 좌측 10)
        savedLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(81)
            make.height.equalTo(45)
        }

        // 전체 10개 라벨 오토레이아웃 (Saved 라벨 기준 상단 16, 좌측 13)
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(savedLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(13)
            make.width.equalTo(55)
            make.height.equalTo(22)
        }

        // 테이블 뷰 오토레이아웃 (전체 10개 라벨 기준 하단 12)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
