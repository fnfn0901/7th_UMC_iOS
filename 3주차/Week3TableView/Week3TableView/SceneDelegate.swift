//
//  SceneDelegate.swift
//  Week3TableView
//
//  Created by 신호연 on 10/3/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let viewController = DiceViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
