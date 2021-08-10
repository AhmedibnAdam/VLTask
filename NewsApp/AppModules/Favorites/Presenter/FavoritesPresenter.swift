//
//  FavoritesPresenter.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IFavoritesPresenter: class {
	// do someting...
}

class FavoritesPresenter: IFavoritesPresenter {	
	weak var view: IFavoritesViewController?
	
	init(view: IFavoritesViewController?) {
		self.view = view
	}
}
