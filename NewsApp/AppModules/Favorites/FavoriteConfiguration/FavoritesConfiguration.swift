//
//  FavoritesConfiguration.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import Foundation
import UIKit

class FavoritesConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = FavoritesViewController()
        let router = FavoritesRouter(view: controller)
        let presenter = FavoritesPresenter(view: controller)
        let Worker = FavoritesWorker()
        let interactor = FavoritesInteractor(presenter: presenter, Worker: Worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        
        controller.parameters = parameters
        return controller
    }
}
