import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let styleVC = StyleViewController()  // 새로운 VC 추가
        let shopVC = ShopViewController()    // 새로운 VC 추가
        let savedVC = SavedViewController()  // 새로운 VC 추가
        let myVC = MyViewController()        // 새로운 VC 추가
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home_fill")?.withRenderingMode(.alwaysOriginal), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style_fill")?.withRenderingMode(.alwaysOriginal), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop_none")?.withRenderingMode(.alwaysOriginal), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "icon_saved_none")?.withRenderingMode(.alwaysOriginal), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "icon_my_none")?.withRenderingMode(.alwaysOriginal), tag: 4)
        
        viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
    }
}
