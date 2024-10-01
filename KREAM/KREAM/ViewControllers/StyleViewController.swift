import UIKit

class StyleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "스타일 화면"
        view.addSubview(label)
    }
}
