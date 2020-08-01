//
//  CGFloat+Extension.swift
//  WorldTacking
//
//  Created by MAHIMA on 01/08/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
