//
//  CategoriesConfiguration.swift
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

class CategoriesConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CategoriesViewController()
        let router = CategoriesRouter(view: controller)
        let presenter = CategoriesPresenter(view: controller)
        let Worker = CategoriesWorker()
        let interactor = CategoriesInteractor(presenter: presenter, Worker: Worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
