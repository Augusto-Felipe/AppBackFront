//
//  QuotationEthTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 14/07/23.
//

import UIKit

class QuotationEthTableViewCellScreen: UIView {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "BFLogin")
        return imageView
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 58/255, green: 52/255, blue: 57/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderWidth =  1.5
        view.layer.borderColor = UIColor(red: 131/255, green: 127/255, blue: 131/255, alpha: 1).cgColor
        return view
    }()
    
    lazy var ethValueLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        lb.textColor = UIColor.white
        return lb
    }()
    
    lazy var ethValueInDollarsLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lb.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        return lb
    }()
    
    lazy var coinEthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(backgroundView)
        backgroundView.addSubview(ethValueLabel)
        backgroundView.addSubview(ethValueInDollarsLabel)
        addSubview(coinEthImageView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            
            backgroundView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            backgroundView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalToConstant: 150),
            
            ethValueLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 50),
            ethValueLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            
            ethValueInDollarsLabel.topAnchor.constraint(equalTo: ethValueLabel.bottomAnchor, constant: 10),
            ethValueInDollarsLabel.leadingAnchor.constraint(equalTo: ethValueLabel.leadingAnchor),
            
            coinEthImageView.topAnchor.constraint(equalTo: topAnchor, constant: 36),
            coinEthImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            coinEthImageView.heightAnchor.constraint(equalToConstant: 240),
        ])
    }
}
