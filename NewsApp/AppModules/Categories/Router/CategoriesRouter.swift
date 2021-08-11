//
//  CategoriesRouter.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol ICategoriesRouter: class {
	func navigateToHeadlines()
}

class CategoriesRouter: ICategoriesRouter {	
	weak var view: CategoriesViewController?
	
	init(view: CategoriesViewController?) {
		self.view = view
	}
    func navigateToHeadlines(){
        view?.navigate(type: .modal, module: Route.headlines, completion: nil)
    }

}
