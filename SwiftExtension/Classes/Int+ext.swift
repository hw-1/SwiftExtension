//
//  Int+ext.swift
//  APP
//
//  Created by t on 2019/10/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension Int {
  public  func indexString() -> String {
        var count = 0
         for _ in 1...(self + 1) {
            count += 1
            count += ((count - 4 ) % 10 == 0 ) ? 1 :  0
         }
        return "\(count)"
    }
}


