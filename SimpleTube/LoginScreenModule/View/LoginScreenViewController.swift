//
//  LoginScreenViewController.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var apiTextField: UITextField!
    @IBOutlet weak var stayLoggedSwitch: UISwitch!
    @IBOutlet weak var logInButton: UIButton!
    // need activityIndicator inside LoginButton
    @IBOutlet weak var howToButton: UIButton!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    
    //MARK: - Variables
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    var presenter: LoginScreenPresenterProtocol!
    
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginButton()
        setupGesture()
        presenter.setupAnimations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.performAnimations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.apiTextField.delegate = self
        presenter.addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.removeKeyboardObserver()
    }
    
    
    //MARK: - Private Methods
    
    private func setupLoginButton() {
        logInButton.layer.cornerRadius = 16
        logInButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        logInButton.layer.borderWidth = 2
        logInButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        logInButton.layer.shadowOpacity = 1
        logInButton.layer.shadowRadius = 8
        logInButton.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    
    //MARK: - IBActions
    
    @IBAction func tapLogIn(_ sender: UIButton) {
        let apiKey = apiTextField.text
        let switchIsOn = stayLoggedSwitch.isOn
        presenter.performLogin(with: apiKey, switchIsOn: switchIsOn)
    }
    
    @IBAction func tapHowTo(_ sender: UIButton) {
        
    }
    
}


//MARK: - Login Screen Protocol Methods

extension LoginScreenViewController: LoginScreenProtocol {
            
    func showAlert(with title: String?, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        ac.addAction(ok)
        present(ac, animated: true)
    }
    
    func proceedToScreen(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard () {
        self.view.endEditing(true)
    }
}


//MARK: - TextField Delegate Methods

extension LoginScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
