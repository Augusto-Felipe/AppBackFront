//
//  LoginScreen.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 19/03/23.
//

import UIKit

class LoginScreen: UIView {
    
    lazy var bgImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG Login 1")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bfLogin")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "BF NFT"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "O marketplace de NFTs da BackFront Academy"
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Recuperar senha?", for: .normal)
        bt.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        bt.addTarget(self, action: #selector(recoverPasswordButtonPressed), for: .touchUpInside)
        return bt
    }()
    
    lazy var buttonBackgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return bt
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var signInMetaMaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var signInMetaMaskImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image 1")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var signInMetamaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Entrar com Metamask"
        return label
    }()
    
    @objc func recoverPasswordButtonPressed(_ sender: UIButton) {
        print(#function)
    }
    
    @objc func loginButtonPressed(_ sender: UIButton) {
        print(#function)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(bgImageView)
        self.addSubview(logoAppImageView)
        self.addSubview(loginLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
        self.addSubview(recoverPasswordButton)
        self.addSubview(buttonBackgroundImage)
        self.addSubview(loginButton)
        self.addSubview(lineView)
        self.addSubview(signInMetaMaskView)
        signInMetaMaskView.addSubview(signInMetaMaskImageView)
        signInMetaMaskView.addSubview(signInMetamaskLabel)
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            self.bgImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.bgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bgImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 100),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 100),
            
            self.loginLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 10),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.loginTextField.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 30),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.loginTextField.heightAnchor),
            
            self.recoverPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 9),
            self.recoverPasswordButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.recoverPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            self.buttonBackgroundImage.topAnchor.constraint(equalTo: self.recoverPasswordButton.bottomAnchor, constant: 30),
            self.buttonBackgroundImage.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.buttonBackgroundImage.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.buttonBackgroundImage.heightAnchor.constraint(equalTo: self.loginTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.buttonBackgroundImage.topAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.buttonBackgroundImage.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.buttonBackgroundImage.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.buttonBackgroundImage.heightAnchor),
            
            self.lineView.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 48),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            self.lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            
            self.signInMetaMaskView.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 30),
            self.signInMetaMaskView.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.signInMetaMaskView.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.signInMetaMaskView.heightAnchor.constraint(equalToConstant: 41),
            
            self.signInMetaMaskImageView.leadingAnchor.constraint(equalTo: self.signInMetaMaskView.leadingAnchor, constant: 65),
            self.signInMetaMaskImageView.centerYAnchor.constraint(equalTo: self.signInMetaMaskView.centerYAnchor),
            self.signInMetaMaskImageView.heightAnchor.constraint(equalToConstant: 20),
            self.signInMetaMaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            self.signInMetamaskLabel.leadingAnchor.constraint(equalTo: self.signInMetaMaskImageView.trailingAnchor, constant: 20),
            self.signInMetamaskLabel.centerYAnchor.constraint(equalTo: self.signInMetaMaskView.centerYAnchor),
        ])
    }
}
