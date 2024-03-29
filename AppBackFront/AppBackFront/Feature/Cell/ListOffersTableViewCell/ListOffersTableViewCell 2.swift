//
//  ListOffersTableViewCell.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 13/07/23.
//

import UIKit
import AlamofireImage

class ListOffersTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: ListOffersTableViewCell.self)
    
    private lazy var screen: ListOffersTableViewCellScreen = {
        let screen = ListOffersTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: LatestDeal, isInicial: Bool, isFinal: Bool) {
        if let url: URL = URL(string: data.userImage ?? "") {
            screen.userImageView.af.setImage(withURL: url, placeholderImage: UIImage(systemName: "person.circle.fill")?.withTintColor(.black))
        }
        
        screen.layer.borderColor = UIColor.white.cgColor
        screen.layer.borderWidth = 0.5
        screen.nameUserLabel.text = data.userName
        screen.nftPriceLabel.text = "\(data.nftPrice ?? 0) ETH"
        screen.lastVisualizationLabel.text = data.lastAccess ?? ""
        
        if isInicial {
            screen.roundCorners(cornerRadius: 20, typeCorner: [.topLeft, .topRight])
        }
        
        if isFinal {
            screen.roundCorners(cornerRadius: 20, typeCorner: [.bottomLeft, .bottomRight])
        }
    }
}

