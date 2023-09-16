//
//  CACornerMask+Extension.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 13/07/23.
//

import UIKit
import Foundation

extension CACornerMask {
    
    static public let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static public let bottomLeft: CACornerMask = .layerMinXMaxYCorner
    static public let topRight: CACornerMask = .layerMaxXMinYCorner
    static public let topLeft: CACornerMask = .layerMinXMinYCorner
}
