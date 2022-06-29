//
//  Global.swift
//  WordleProject
//
//  Created by Dinesh Kumar Raj Kumar on 2022-06-29.
//

import UIKit

enum Global{
    
    static var screenwidth: CGFloat{
        UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: CGFloat{
        UIScreen.main.bounds.size.height
    }
    
    static var minDimension: CGFloat{
        min(screenwidth, screenHeight)
    }
    
    static var boardWidth: CGFloat{
        switch minDimension{
        case 0...320:
            return  screenwidth - 55 ;
        case 321...430:
            return screenwidth - 50;
        case 431 ... 1000:
            return 350
            
        default:
            return 500
        }
    }
    
    static var keyboardScale:  CGFloat{
        switch minDimension{
        case 0...430:
            return screenwidth / 390;
        case 431...1000:
            return CGFloat(1.2)
        default:
            return CGFloat(1.6)
        }
    }
}
