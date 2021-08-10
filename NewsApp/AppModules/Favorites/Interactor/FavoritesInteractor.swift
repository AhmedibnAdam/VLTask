//
//  FavoritesInteractor.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IFavoritesInteractor: class {
	var parameters: [String: Any]? { get set }
}

class FavoritesInteractor: IFavoritesInteractor {
    var presenter: IFavoritesPresenter?
    var Worker: IFavoritesWorker?
    var parameters: [String: Any]?

    init(presenter: IFavoritesPresenter, Worker: IFavoritesWorker) {
    	self.presenter = presenter
    	self.Worker = Worker
    }
}
