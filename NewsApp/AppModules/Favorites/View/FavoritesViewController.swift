//
//  FavoritesViewController.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IFavoritesViewController: class {
	var router: IFavoritesRouter? { get set }
}

class FavoritesViewController: UIViewController {
	var interactor: IFavoritesInteractor?
	var router: IFavoritesRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension FavoritesViewController: IFavoritesViewController {
	// do someting...
}

extension FavoritesViewController {
	// do someting...
}

extension FavoritesViewController {
	// do someting...
}
