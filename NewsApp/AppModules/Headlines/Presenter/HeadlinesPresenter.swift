//
//  HeadlinesPresenter.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IHeadlinesPresenter: class {
    func showHeadlines(headlines: HeadlinesModel.Response)
}

class HeadlinesPresenter: IHeadlinesPresenter {	
	weak var view: IHeadlinesViewController?
	
	init(view: IHeadlinesViewController?) {
		self.view = view
	}
    
    func showHeadlines(headlines: HeadlinesModel.Response){
        view?.showHeadlines(headlines: headlines)

    }

}
