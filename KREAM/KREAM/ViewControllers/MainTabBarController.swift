import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let styleVC = StyleViewController()
        let shopVC = ShopViewController()
        let savedVC = SavedViewController()
        let myVC = MyViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home_fill")?.withRenderingMode(.alwaysOriginal), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style_fill")?.withRenderingMode(.alwaysOriginal), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop_none")?.withRenderingMode(.alwaysOriginal), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "icon_saved_none")?.withRenderingMode(.alwaysOriginal), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "icon_my_none")?.withRenderingMode(.alwaysOriginal), tag: 4)
        
        viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
        addTopBorderToTabBar()
    }
    
    // 탭바 상단에 2px 보더 추가
    func addTopBorderToTabBar() {
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1).cgColor
        borderLayer.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 2)
        
        tabBar.layer.addSublayer(borderLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addTopBorderToTabBar()
    }
}
