//
//  NavigationViewController.swift
//  KREAM
//
//  Created by 신호연 on 9/30/24.
//

import UIKit

class NavigationViewController: UIViewController {
    private let label = UILabel()
    private lazy var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        label.textColor = .systemYellow
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemTeal
                
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

    }

    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .lightGray
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}
