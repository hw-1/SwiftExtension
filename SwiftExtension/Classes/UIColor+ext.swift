//
//  UIColor+ext.swift
//  APP_Example
//
//  Created by t on 2019/9/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public extension UIColor{
  convenience init(colorHex hex: UInt, alpha: CGFloat = 1) {
    var aph = alpha
    if aph < 0 {
        aph = 0
    }else if aph > 1 {
        aph = 1
    }
    
    self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255,
              green: CGFloat((hex & 0x00FF00) >> 8) / 255,
              blue: CGFloat(hex & 0x0000FF) / 255,
              alpha: aph)
}

}


extension UIColor {
   public  static func random() -> UIColor {
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1.0)
    }
}
