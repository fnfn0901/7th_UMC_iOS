import UIKit
import SnapKit

class ProductCell: UITableViewCell {

    // 상품 이미지 뷰
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 상품 설명 텍스트 1
    let productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        return label
    }()
    
    // 상품 설명 텍스트 2
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 9)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // 찜하기 버튼 (SF Symbol 사용)
    private let wishlistButton: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        let bookmarkImage = UIImage(systemName: "bookmark.fill", withConfiguration: symbolConfig)  // 'bookmark.fill'로 변경
        button.setImage(bookmarkImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 가격 라벨
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        label.textColor = UIColor.black
        label.textAlignment = .right
        return label
    }()
    
    // 초기화 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 레이아웃 설정
    private func setupLayout() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productTitleLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(wishlistButton)
        contentView.addSubview(priceLabel)
        
        // 상품 이미지 레이아웃
        productImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(13)
            make.top.equalToSuperview().offset(13)
            make.width.height.equalTo(72)
        }

        // 상품 제목 레이아웃
        productTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(13)
            make.top.equalToSuperview().offset(13)
            make.width.equalTo(153)
            make.height.equalTo(19)
        }

        // 상품 설명 레이아웃
        productDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(productTitleLabel)
            make.top.equalTo(productTitleLabel.snp.bottom).offset(5)
            make.width.equalTo(153)
        }
        
        // 찜하기 버튼 레이아웃
        wishlistButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().offset(-13)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        // 가격 라벨 레이아웃
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-13)
            make.bottom.equalToSuperview().offset(-13)
        }
    }
}
