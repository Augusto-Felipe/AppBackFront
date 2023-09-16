//
//  UIViewController+Extension.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 05/06/23.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
