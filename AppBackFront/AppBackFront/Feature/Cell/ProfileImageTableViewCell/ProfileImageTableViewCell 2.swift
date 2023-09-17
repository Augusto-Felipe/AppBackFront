//
//  ProfileImageTableViewCell.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 14/07/23.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ProfileImageTableViewCell.self)
    
    private lazy var screen: ProfileImageTableViewCellScreen = {
        let screen = ProfileImageTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
