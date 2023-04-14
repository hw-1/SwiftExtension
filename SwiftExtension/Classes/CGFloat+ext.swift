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
    
    public static func safeAreaTop() -> CGFloat {
        return UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.safeAreaInsets.top ?? 0
    }
    
    public static func safeAreaBottom() -> CGFloat {
        return UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.safeAreaInsets.bottom ?? 0
    }
}
