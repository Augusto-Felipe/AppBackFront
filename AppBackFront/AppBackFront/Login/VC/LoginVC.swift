//
//  ViewController.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 19/03/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

