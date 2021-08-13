//
//  HeadlinesInteractor.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol IHeadlinesInteractor: class {
	var parameters: [String: Any]? { get set }
    func getFirstFavorite()
    func getSecondFavorite()
    func getThirdFavorite()
}

class HeadlinesInteractor: IHeadlinesInteractor {
    var presenter: IHeadlinesPresenter?
    var Worker: IHeadlinesWorker?
    var parameters: [String: Any]?

    init(presenter: IHeadlinesPresenter, Worker: IHeadlinesWorker) {
    	self.presenter = presenter
    	self.Worker = Worker
    }
    
    func getFirstFavorite(){
        if Reachability.isConnectedToNetwork(){
            Worker?.getFirstFav(complition: { (error, success, headlines) in
                if success {
                    guard let headlines = headlines else {
                        return
                    }
                    self.presenter?.showFirstFavHeadlines(headlines: headlines)
                }
                
            })
        }
    }
    func getSecondFavorite(){
        if Reachability.isConnectedToNetwork(){
            Worker?.getSecondFav(complition: { (error, success, headlines) in
                if success {
                    guard let headlines = headlines else {
                        return
                    }
                    self.presenter?.showSecondFavHeadlines(headlines: headlines)
                }
                
            })
        }
    }
    func getThirdFavorite(){
        if Reachability.isConnectedToNetwork(){
            Worker?.getThirdFav(complition: { (error, success, headlines) in
                if success {
                    guard let headlines = headlines else {
                        return
                    }
                    self.presenter?.showThirdFavHeadlines(headlines: headlines)
                }
                
            })
        }
    }
}
