//
//  UIScreen.swift
//  SwiftExtension
//
//  Created by hw on 2019/4/12.
//

import UIKit

public extension UIScreen {
    
    public class  func width() -> CGFloat {
      return UIScreen.main.bounds.width
    }
    
    public class func height() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
