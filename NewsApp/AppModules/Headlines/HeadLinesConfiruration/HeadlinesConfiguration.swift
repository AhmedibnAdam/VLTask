//
//  HeadlinesConfiguration.swift
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

class HeadlinesConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = HeadlinesViewController()
        let router = HeadlinesRouter(view: controller)
        let presenter = HeadlinesPresenter(view: controller)
        let Worker = HeadlinesWorker()
        let interactor = HeadlinesInteractor(presenter: presenter, Worker: Worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
