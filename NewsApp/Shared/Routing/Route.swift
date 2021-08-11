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
