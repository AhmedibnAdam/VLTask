//
//  HeadlinesViewController.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IHeadlinesViewController: class {
	var router: IHeadlinesRouter? { get set }
}

class HeadlinesViewController: UIViewController {
	var interactor: IHeadlinesInteractor?
	var router: IHeadlinesRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension HeadlinesViewController: IHeadlinesViewController {
	// do someting...
}

extension HeadlinesViewController {
	// do someting...
}

extension HeadlinesViewController {
	// do someting...
}
