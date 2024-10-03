//
//  SceneDelegate.swift
//  3주차
//
//  Created by 신호연 on 10/3/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // UIWindow를 설정하고, 초기 ViewController를 지정
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController() // 초기 뷰 컨트롤러 설정
        window?.makeKeyAndVisible() // 창을 보이도록 설정
    }
}

