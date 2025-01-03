//
//  UIColorTransFormer.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 31/12/2024.
//

import Foundation
import UIKit
class UIColorTransformer : ValueTransformer {
    
    //serialize UIColor into Data.
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else {return nil}
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data 
        }catch {
            return nil
        }
    }
    
    //deserialize Data back into UIColor
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {return nil}
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data )
            return color
        }catch {
            return nil
        }
    }
}
