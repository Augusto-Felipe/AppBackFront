//
//  NftDetailViewModel.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 12/07/23.
//

import UIKit

class NftDetailViewModel {
    
    let nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 3
    }
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }
    
    public var idNFT: Int {
        return nft.nftID ?? 0
    }
    
    public var titleNFT: String {
        return nft.nftNameImage ?? ""
    }
    
    public var descriptionNFT: String {
        return nft.nftDescription ?? ""
    }
    
    public var getNft: Nft {
        return nft
    }
    
    public func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat {
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case .nftImage:
            return 400
        case .description:
            return descriptionNFT.height(withConstrainedWidth: width - 40, font: UIFont.systemFont(ofSize: 18)) + 89
        case .latestDeal:
            return HeightLatestDeal.height.rawValue * CGFloat(nft.latestDeals?.count ?? 0) + 75
        default:
            return 0
        }
    }
}
