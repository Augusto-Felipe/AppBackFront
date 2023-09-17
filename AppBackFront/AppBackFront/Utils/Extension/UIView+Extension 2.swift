//
//  UIView+Extension.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 13/07/23.
//

import UIKit
import Foundation

extension UIView {
    
    func roundCorners(cornerRadius: Double, typeCorner: CACornerMask) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorner
    }
}
