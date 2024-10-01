import UIKit

class ProfileSettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "프로필 관리 화면"
        view.addSubview(label)
    }
}
