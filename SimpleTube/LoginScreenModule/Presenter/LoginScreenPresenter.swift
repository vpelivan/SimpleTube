//
//  LoginPresenter.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation
import UIKit

protocol LoginScreenProtocol: class {
    var searchController: UISearchController? { get set }
    func proceedToScreen(viewController: UIViewController)
    func showAlert(with title: String?, message: String)
}

protocol LoginScreenPresenterProtocol: class {
    init(view: LoginScreenProtocol)
    func performLogin(with apiKey: String?, switchIsOn: Bool)
    func performButtonAnimation(withDuration duration: Double, delay: Double, for button: UIButton)
    func performImageViewAnimation(withDuration duration: Double, delay: Double, for imageView: UIImageView)
    func performLabelAnimation(withDuration duration: Double, delay: Double, for label: UILabel)
}

class LoginScreenPresenter: LoginScreenPresenterProtocol {
    
    weak var view: LoginScreenProtocol?
    
    let networkManager = NetworkManager()
    let animations = Animations()
    
    required init(view: LoginScreenProtocol) {
        self.view = view
    }
    
    func performLogin(with apiKey: String?, switchIsOn: Bool) {
        
        let navigationController = ModuleBuilder.CreateMainScreen()
        guard apiKey != "" else {
            view?.showAlert(with: "API Key Field is empty", message: "Enter a valid API Key")
            return
        }
        networkManager.validateApiKey(from: apiKey) {
            (isValid, error)  in
            if isValid == true {
                if switchIsOn == true {
                    //save key in CoreData
                } else {
                    //delete all keys from CoreData
                }
                //proceed to main screen
                self.view?.proceedToScreen(viewController: navigationController)
            } else if let error = error {
                guard let title = error.error?.code, let message = error.error?.message else { return }
                self.view?.showAlert(with: "Request code: \(title)", message: message)
            } else {
                self.view?.showAlert(with: "API Key is wrong", message: "Enter a valid API Key")
                return
            }
            
        }
    }
    
    func performButtonAnimation(withDuration duration: Double, delay: Double, for button: UIButton) {
        animations.slideObjectFromSide(withDuration: duration, delay: delay) {
            button.transform = .identity
            button.alpha = 1
        }
    }
    
    func performImageViewAnimation(withDuration duration: Double, delay: Double, for imageView: UIImageView) {
        animations.slideObjectFromSide(withDuration: duration, delay: delay) {
            imageView.transform = .identity
            imageView.alpha = 1
        }
    }
    
    func performLabelAnimation(withDuration duration: Double, delay: Double, for label: UILabel) {
        animations.slideObjectFromSide(withDuration: duration, delay: delay) {
            label.transform = .identity
            label.alpha = 1
        }
    }
}
