//
//  CategoriesPresenter.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol ICategoriesPresenter: class {
	// do someting...
}

class CategoriesPresenter: ICategoriesPresenter {	
	weak var view: ICategoriesViewController?
	
	init(view: ICategoriesViewController?) {
		self.view = view
	}
}
