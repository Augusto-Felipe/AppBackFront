//
//  LoginScreen.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 08/04/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func loginButtonPressed()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BGLogin")
        return image
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BFLogin")
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        lb.text = "BF NFT"
        return lb
    }()
    
    lazy var appDescriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.textAlignment = .center
        lb.text = "O marketplace de NFTs da Backfront Academy"
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
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
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.autocorrectionType = .no
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.isSecureTextEntry = true
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Recuperar senha?", for: .normal)
        bt.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        bt.addTarget(self, action: #selector(recoverPasswordPressed), for: .touchUpInside)
        return bt
    }()
    
    lazy var loginButtonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradient3")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
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
        bt.isEnabled = false
        bt.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return bt
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var signInMetamasView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var signInMetamaskImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var signInMetamaskLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.text = "Entrar com Metamask"
        return lb
    }()
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc func recoverPasswordPressed() {
        
    }
    
    @objc func loginButtonPressed() {
        self.delegate?.loginButtonPressed()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(backgroundImage)
        self.addSubview(logoImageView)
        self.addSubview(loginLabel)
        self.addSubview(appDescriptionLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(recoverPasswordButton)
        self.addSubview(loginButtonImageView)
        self.addSubview(loginButton)
        self.addSubview(lineView)
        self.addSubview(signInMetamasView)
        signInMetamasView.addSubview(signInMetamaskImageView)
        signInMetamasView.addSubview(signInMetamaskLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 110),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 110),
            
            self.loginLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 16),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.appDescriptionLabel.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 5),
            self.appDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.appDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.appDescriptionLabel.bottomAnchor, constant: 30),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 39),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 30),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.recoverPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.recoverPasswordButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.recoverPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            self.loginButtonImageView.topAnchor.constraint(equalTo: self.recoverPasswordButton.bottomAnchor, constant: 20),
            self.loginButtonImageView.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButtonImageView.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButtonImageView.heightAnchor.constraint(equalToConstant: 43),
            
            self.loginButton.topAnchor.constraint(equalTo: self.loginButtonImageView.topAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 43),
            
            self.lineView.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 48),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            self.lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            self.signInMetamasView.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 48),
            self.signInMetamasView.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.signInMetamasView.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.signInMetamasView.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.signInMetamaskImageView.centerYAnchor.constraint(equalTo: self.signInMetamasView.centerYAnchor),
            self.signInMetamaskImageView.leadingAnchor.constraint(equalTo: self.signInMetamasView.leadingAnchor, constant: 50),
            self.signInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            self.signInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            self.signInMetamaskLabel.centerYAnchor.constraint(equalTo: self.signInMetamasView.centerYAnchor),
            self.signInMetamaskLabel.leadingAnchor.constraint(equalTo: self.signInMetamaskImageView.trailingAnchor, constant: 50),
        ])
    }
}
