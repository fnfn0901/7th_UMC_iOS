//
//  ViewController.swift
//  3주차
//
//  Created by 신호연 on 10/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = userDefaultsview
    }
    
    private lazy var userDefaultsview: UserDefaultsView = {
        let view = UserDefaultsView()
        return view
    }()
}
