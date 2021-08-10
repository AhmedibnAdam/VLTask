//
//  CategoriesInteractor.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol ICategoriesInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CategoriesInteractor: ICategoriesInteractor {
    var presenter: ICategoriesPresenter?
    var Worker: ICategoriesWorker?
    var parameters: [String: Any]?

    init(presenter: ICategoriesPresenter, Worker: ICategoriesWorker) {
    	self.presenter = presenter
    	self.Worker = Worker
    }
}
