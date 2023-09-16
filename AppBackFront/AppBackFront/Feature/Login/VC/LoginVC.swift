//
//  ViewController.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 08/04/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = AlertController(controller: self)
        self.auth = Auth.auth()
        dismissKeyboard()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
    }
    
    public func registerNewUser(email: String, password: String) {
        self.auth?.signIn(withEmail: email, password: password, completion: { user, error in
            if error != nil {
                self.alert?.createAlert(title: "Erro ao fazer Login.", message: error?.localizedDescription ?? "", completion: {
                    print("Botão pressionado")
                })
            } else {
                print("Successo ao fazer login.")
            }
        })
    }
    
    public func validateTextFields(email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            if email.isValid(validType: .email) && password.isValid(validType: .password) {
                loginScreen?.loginButton.isEnabled = true
                registerNewUser(email: email, password: password)
            } else {
                print("Email no formato incorreto e senha deve conter no mínimo 6 caracteres..")
            }
        } else {
            loginScreen?.loginButton.isEnabled = false
        }
    }
}

extension LoginVC: LoginScreenProtocol {
    func loginButtonPressed() {

        guard let email = loginScreen?.emailTextField.text,
              let password = loginScreen?.passwordTextField.text else { return }
        
        validateTextFields(email: email, password: password)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? false {
            loginScreen?.loginButton.isEnabled = false
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            loginScreen?.loginButton.isEnabled = true
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
