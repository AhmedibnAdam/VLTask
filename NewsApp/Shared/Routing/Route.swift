//
//  RootRoute.swift
//  NewsApp
//
//  Created by Adam on 8/9/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import Foundation
import UIKit

enum Route: IRouter {
    /*
     If you want passing with parameters
     you just add like this:
     
     case sample
     case sample(parameter: [String: Any])
     
     you can use: String, Int, [String: Any], etc..
     */
    case cats
    case headlines
}

extension Route {
    var module: UIViewController? {
        
        switch self {
        case .cats:
            return CategoriesConfiguration.setup()
        case .headlines:
            return HeadlinesConfiguration.setup()
        }
        
        
    }
}
