//
//  NftDetailVC.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 12/07/23.
//

import UIKit

enum NameCellNftDetail: Int {
    case nftImage = 0
    case description = 1
    case latestDeal = 2
}

class NftDetailVC: UIViewController {
    
    let viewModel: NftDetailViewModel
    
    private lazy var screen: NftDetailScreen = {
        let screen = NftDetailScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    required init(nft: Nft) {
        viewModel = NftDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = NftDetailScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen.configTableView(delegate: self, datasource: self)
    }
}

extension NftDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch NameCellNftDetail(rawValue: indexPath.row) {
        case .nftImage:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell
            cell?.setupCell(urlImage: viewModel.nftImage, delegate: self)
            return cell ?? UITableViewCell()
        case .description:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setupCell(id: viewModel.idNFT, title: viewModel.titleNFT, description: viewModel.descriptionNFT)
            return cell ?? UITableViewCell()
            
        case .latestDeal:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestDealTableViewCell.identifier, for: indexPath) as? LatestDealTableViewCell
            cell?.setupCell(data: viewModel.getNft)
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRowAt(indexPath: indexPath, width: view.frame.width)
    }
}

extension NftDetailVC: NftImageTableViewCellScreenProtocol {
    func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    func magnifyingGlassButtonTapped() {
        let vc = MagnifyingGlassVC(urlImage: viewModel.nftImage)
        present(vc, animated: true)
    }
}
