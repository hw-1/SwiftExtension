//
//  UIViewController.swift
//  SwiftExtension
//
//  Created by hw on 2019/4/12.
//

import UIKit

/*
 How to Use
 if let topController = UIApplication.topViewController() {
 
 }
 
 */

// MARK: - Properties
public extension UIApplication {
   public  class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
