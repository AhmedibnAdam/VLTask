//
//  HeadlinesRouter.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IHeadlinesRouter: class {
    func navigateToFavorites(parameters: [String: Any])
}

class HeadlinesRouter: IHeadlinesRouter {
    
    
    weak var view: HeadlinesViewController?
    
    init(view: HeadlinesViewController?) {
        self.view = view
    }
    
    func navigateToFavorites(parameters: [String : Any]) {
        view?.navigate(type: .modalWithNavigation, module: Route.favorites(parameters: parameters), completion: nil)
    }
    
    
}
