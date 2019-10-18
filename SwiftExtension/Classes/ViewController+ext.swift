//
//  ViewController+ext.swift
//  APP_Example
//
//  Created by t on 2019/9/29.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension UIViewController {
   public class func loadViewController(withIdentifier: String) -> UIViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: withIdentifier)
        //        UIApplication.shared.keyWindow?.rootViewController = viewController;
        return viewController
    }
}

extension UIViewController {
   public static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
