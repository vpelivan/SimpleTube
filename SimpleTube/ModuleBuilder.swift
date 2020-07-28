//
//  ModuleBuilder.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 17.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation
import UIKit

protocol Builder {
    static func CreateLoginScreen() -> UIViewController
    static func CreateMainScreen() -> UINavigationController
    static func CreatePlayerScreen(for item: Item) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func CreateLoginScreen() -> UIViewController {
        let view = LoginScreenViewController()
        let presenter = LoginScreenPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func CreateMainScreen() -> UINavigationController {
       let view = MainScreenViewController(nibName: "MainScreenViewController", bundle: nil)
        let presenter = MainScreenPresenter(view: view)
        view.presenter = presenter
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.prefersLargeTitles = true
        
//        navigationController.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        return navigationController
    }
    
    static func CreatePlayerScreen(for item: Item) -> UIViewController {
        return UIViewController()
    }
    
}
