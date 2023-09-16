//
//  NftTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 12/06/23.
//

import UIKit

class NftTableViewCellScreen: UIView {
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()
    
    lazy var nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var ownedByPriceLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = UIColor(red: 69/255, green: 192/255, blue: 229/255, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return lb
    }()
    
    lazy var userLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        return lb
    }()
    
    lazy var priceLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lb.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
        return lb
    }()
    
    lazy var priceValueLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(viewBackground)
        viewBackground.addSubview(nftImageView)
        viewBackground.addSubview(userImageView)
        viewBackground.addSubview(ownedByPriceLabel)
        viewBackground.addSubview(userLabel)
        viewBackground.addSubview(priceLabel)
        viewBackground.addSubview(priceValueLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: 340),
            
            nftImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.heightAnchor.constraint(equalToConstant: 270),
            
            userImageView.topAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: 10),
            userImageView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 8),
            userImageView.heightAnchor.constraint(equalToConstant: 48),
            userImageView.widthAnchor.constraint(equalToConstant: 48),
            
            ownedByPriceLabel.topAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: 20),
            ownedByPriceLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            
            userLabel.topAnchor.constraint(equalTo: ownedByPriceLabel.bottomAnchor, constant: 5),
            userLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            
            priceLabel.topAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -15),
            
            priceValueLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            priceValueLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -15),
            
        ])
    }
}
