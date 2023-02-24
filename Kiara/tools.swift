//
//  tools.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-24.
//

import Foundation
import UIKit

public class Tools{
    
    public func getColorName(color:UIColor) -> String{
        switch color{
        case UIColor.systemGray:
            return "gray"
        case UIColor.systemRed:
            return "red"
        case UIColor.systemGreen:
            return "green"
        case UIColor.systemBlue:
            return "blue"
        case UIColor.systemCyan:
            return "cyan"
        case UIColor.systemYellow:
            return "yellow"
        case UIColor.systemOrange:
            return "orange"
        case UIColor.systemPink:
            return "pink"
        case UIColor.systemPurple:
            return "purple"
        case UIColor.systemBrown:
            return "brown"
        default:
            return "White"
        }
    }
    
    public func getSystemColor(color:String) -> UIColor
    {
        switch color{
        case "gray":
            return UIColor.systemGray
        case "red":
            return UIColor.systemRed
        case "green":
            return UIColor.systemGreen
        case "blue":
            return UIColor.systemBlue
        case "cyan":
            return UIColor.systemCyan
        case "yellow":
            return UIColor.systemYellow
        case "orange":
            return UIColor.systemOrange
        case "pink":
            return UIColor.systemPink
        case "purple":
            return UIColor.systemPurple
        case "brown":
            return UIColor.systemBrown
        default:
            return UIColor.white
        }
    }
}
