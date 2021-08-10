//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol ICategoriesViewController: class {
	var router: ICategoriesRouter? { get set }
}

class CategoriesViewController: UIViewController {
	var interactor: ICategoriesInteractor?
	var router: ICategoriesRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CategoriesViewController: ICategoriesViewController {
	// do someting...
}

extension CategoriesViewController {
	// do someting...
}

extension CategoriesViewController {
	// do someting...
}
