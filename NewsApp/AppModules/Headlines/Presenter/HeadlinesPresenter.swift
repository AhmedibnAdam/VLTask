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
    func showFirstFavHeadlines(headlines: HeadlinesModel.Response)
    func showSecondFavHeadlines(headlines: HeadlinesModel.Response)
    func showThirdFavHeadlines(headlines: HeadlinesModel.Response)
    
}

class HeadlinesPresenter: IHeadlinesPresenter {
    
    weak var view: IHeadlinesViewController?
    
    init(view: IHeadlinesViewController?) {
        self.view = view
    }
    
    func showFirstFavHeadlines(headlines: HeadlinesModel.Response){
        view?.showFirstFavHeadlines(headlines: headlines)
        
    }
    func showSecondFavHeadlines(headlines: HeadlinesModel.Response) {
        view?.showSecondFavHeadlines(headlines: headlines)
        
    }
    
    func showThirdFavHeadlines(headlines: HeadlinesModel.Response) {
        view?.showThirdFavHeadlines(headlines: headlines)
        
    }
    
    
}
