//
//  MagnifyingGlassVC.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 13/07/23.
//

import UIKit
import AlamofireImage

class MagnifyingGlassVC: UIViewController {
    
    private var urlImage: String
    
    private lazy var screen: MagnifyingGlassScreen = {
        let screen = MagnifyingGlassScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    required init(urlImage: String) {
        self.urlImage = urlImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = MagnifyingGlassScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen.delegate(delegate: self)
        configImage()
    }
    
    func configImage() {
        guard let url = URL(string: urlImage) else { return }
        screen.nftImageView.af.setImage(withURL: url)
    }
}

extension MagnifyingGlassVC: MagnifyingGlassScreenProtocol {
    func backButtonTapped() {
        dismiss(animated: true)
    }
}
