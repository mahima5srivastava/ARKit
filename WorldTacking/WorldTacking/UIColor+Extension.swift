//
//  UIColor+Extension.swift
//  WorldTacking
//
//  Created by MAHIMA on 01/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var random: UIColor {
        return UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
}
