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
    var welcomeLabel: UILabel! { get set }
    var logoImageView: UIImageView! { get set }
    var apiTextField: UITextField! { get set }
    var stayLoggedSwitch: UISwitch! { get set }
    var logInButton: UIButton! { get set }
    var howToButton: UIButton! { get set }
    var scrollViewBottomConstraint: NSLayoutConstraint! { get set }
    func proceedToScreen(viewController: UIViewController)
    func showAlert(with title: String?, message: String)
    func setupGesture()
}

protocol LoginScreenPresenterProtocol: class {
    init(view: LoginScreenProtocol)
    func performLogin(with apiKey: String?, switchIsOn: Bool)
    func setupAnimations()
    func performAnimations()
    func addKeyboardObserver()
    func removeKeyboardObserver()
}

class LoginScreenPresenter: LoginScreenPresenterProtocol {
    
    weak var view: LoginScreenProtocol?
    private let notificationCenter = NotificationCenter.default
    private let kbWillShowName = UIResponder.keyboardWillShowNotification
    private let kbWillHideName = UIResponder.keyboardWillHideNotification
    
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
            (keyIsValid, error)  in
            if keyIsValid == true {
                if switchIsOn == true {
                    //save key in CoreData
                } else {
                    //delete all keys from CoreData
                }
                self.view?.proceedToScreen(viewController: navigationController)
            }
            else if let error = error {
                guard let title = error.error?.code, let message = error.error?.message else { return }
                self.view?.showAlert(with: "Request code: \(title)", message: message)
            }
            else {
                self.view?.showAlert(with: "API Key is wrong", message: "Enter a valid API Key")
                return
            }
        }
    }
    
    func setupAnimations() {
        
        view?.welcomeLabel.transform = CGAffineTransform(translationX: 0, y: -500)
        view?.logoImageView.transform = CGAffineTransform(translationX: 500, y: 0)
        view?.logInButton.transform = CGAffineTransform(translationX: -500, y: 0)
        
        view?.logInButton.alpha = 0
        view?.welcomeLabel.alpha = 0
        view?.logoImageView.alpha = 0
        view?.howToButton.alpha = 0
    }
    
    func performAnimations() {
        animations.performButtonAnimation(withDuration: 1, delay: 0.2, for: view?.logInButton)
        animations.performImageViewAnimation(withDuration: 1, delay: 0, for: view?.logoImageView)
        animations.performButtonAnimation(withDuration: 3, delay: 1, for: view?.howToButton)
        animations.performLabelAnimation(withDuration: 1, delay: 0.5, for: view?.welcomeLabel)
    }
    
    
    
    public func addKeyboardObserver() {
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: kbWillShowName, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: kbWillHideName, object: nil)
    }
    
    public func removeKeyboardObserver() {
        notificationCenter.removeObserver(self, name: kbWillShowName, object: nil)
        notificationCenter.removeObserver(self, name: kbWillHideName, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.view?.scrollViewBottomConstraint.constant = keyboardSize.height
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        self.view?.scrollViewBottomConstraint.constant = 0
    }
}
