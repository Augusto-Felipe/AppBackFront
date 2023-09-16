//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 07/06/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func sucess()
    func error()
}

class HomeViewModel {
    
    weak private var delegate: HomeViewModelProtocol?
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    private var searchNftData: NFTData?
    
    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
    func fetchRequest(_ typeFetch: TypeFetch) {
        
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error()
                }
            }
        }
    }
    
    //MARK: - FilterCollectionView
    var numberOfItensInSection: Int {
        return searchNftData?.filterNftList?.count ?? 0
    }
    
    func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return searchNftData?.filterNftList?[indexPath.row] ?? FilterNft()
    }
    
    var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    //MARK: - NFTTableViewCell
    var numberOfRowsInSection: Int {
        return searchNftData?.nftList?.count ?? 0
    }
    
    func loadCurrentNft(indexPath: IndexPath) -> Nft {
        return searchNftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    var heightForRowAt: CGFloat {
        return 360
    }
    
    //MARK: - Filter
    
    var typeFilter: Int? {
        return searchNftData?.filterNftList?.first(where: {$0.isSelected == true})?.id
    }
    
    public func filterSearchText(_ text: String) {
        
        var nftList: [Nft] = []
        
        if typeFilter == 0 {
            nftList = nftData?.nftList ?? []
        } else {
            nftList = nftData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? []
        }
        
        
        if text.isEmpty {
            searchNftData?.nftList = nftList
        } else {
            searchNftData?.nftList = nftList.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }
    
    public func setFilter(indexPath: IndexPath, searchText: String) {
        var filterNFT: [FilterNft] = []
        for (index, value) in (searchNftData?.filterNftList ?? []).enumerated() {
            var type = value
            if index == indexPath.row {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            filterNFT.append(type)
        }
        searchNftData?.filterNftList = filterNFT
        filterSearchText(searchText)
    }
}
