//
//  LoginScreenViewController.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit
import LBTATools

class LoginScreenViewController: LBTAFormController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var apiTextField: UITextField!
    @IBOutlet weak var stayLoggedSwitch: UISwitch!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var howToButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    var searchController: UISearchController?
    var presenter: LoginScreenPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginIndicator.isHidden = true
        setupLoginButton()
        prepareForAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.performButtonAnimation(withDuration: 1, delay: 0.2, for: logInButton)
        presenter.performImageViewAnimation(withDuration: 1, delay: 0, for: logoImageView)
        presenter.performButtonAnimation(withDuration: 3, delay: 1, for: howToButton)
        presenter.performLabelAnimation(withDuration: 1, delay: 0.5, for: welcomeLabel)
    }
    
    private func prepareForAnimation() {
        welcomeLabel.transform = CGAffineTransform(translationX: 0, y: -500)
        logoImageView.transform = CGAffineTransform(translationX: 500, y: 0)
        logInButton.transform = CGAffineTransform(translationX: -500, y: 0)
        logInButton.alpha = 0
        welcomeLabel.alpha = 0
        logoImageView.alpha = 0
        howToButton.alpha = 0
    }
    
    private func setupLoginButton() {
        
        logInButton.layer.cornerRadius = 16
        logInButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        logInButton.layer.borderWidth = 2
        logInButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        logInButton.layer.shadowOpacity = 1
        logInButton.layer.shadowRadius = 8
        logInButton.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    @IBAction func tapLogIn(_ sender: UIButton) {
        
        let apiKey = apiTextField.text
        let switchIsOn = stayLoggedSwitch.isOn
        presenter.performLogin(with: apiKey, switchIsOn: switchIsOn)
    }
    
    @IBAction func tapHowTo(_ sender: UIButton) {
    
    }
    
}

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
}
