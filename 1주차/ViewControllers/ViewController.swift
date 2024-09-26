import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = counterView
    }
    
    private lazy var counterView: CountUpDownView = {
        let view = CountUpDownView()
        view.countLabel.text = "1"
        return view
    }()
}
