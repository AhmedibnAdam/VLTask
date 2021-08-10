//
//  FavoritesRouter.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IFavoritesRouter: class {
	// do someting...
}

class FavoritesRouter: IFavoritesRouter {	
	weak var view: FavoritesViewController?
	
	init(view: FavoritesViewController?) {
		self.view = view
	}
}
