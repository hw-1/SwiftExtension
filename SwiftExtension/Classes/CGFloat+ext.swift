//
//  CGFloat+ext.swift
//  KeyboardExtension
//
//  Created by t on 2019/10/18.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension CGFloat {
   public static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
