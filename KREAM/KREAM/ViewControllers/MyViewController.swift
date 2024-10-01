import UIKit

class MyViewController: UIViewController {

    // MyView 인스턴스 생성
    let myView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MyView를 뷰에 추가
        view.addSubview(myView)
        
        // MyView 레이아웃 설정
        myView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // MyView가 전체 화면을 채우도록 설정
        }
    }
}
