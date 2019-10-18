//
//  String+ext.swift
//  APP_Example
//
//  Created by t on 2019/9/29.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension String {
    static func dictionary(data: Data) -> [String: Any]? {
        do {
            if let anyResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                 return anyResult
            }
             return nil
        }catch{
//            APPLogWrapper.shared.log.error(error)
        }
        return nil
    }
    
    func currencyFormat() -> String? {
        if let number = NumberFormatter().number(from: self) {
            let none = NumberFormatter.localizedString(from: number, number: .none)
            return none
        }
         
        return nil
    }
}


extension String {
  subscript(_ i: Int) -> String {
    let idx1 = index(startIndex, offsetBy: i)
    let idx2 = index(idx1, offsetBy: 1)
    return String(self[idx1..<idx2])
  }

  subscript (r: Range<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: min(r.upperBound,self.count))
    return String(self[start ..< end])
  }

  subscript (r: CountableClosedRange<Int>) -> String {
    let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
    let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
    return String(self[startIndex...endIndex])
  }
}
