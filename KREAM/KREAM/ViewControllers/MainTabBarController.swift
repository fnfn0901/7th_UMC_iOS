import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let settingVC = SettingsViewController()
        
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        settingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        viewControllers = [homeVC, settingVC]
    }
}
