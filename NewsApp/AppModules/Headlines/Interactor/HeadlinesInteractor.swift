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
    func getHeadlines()
}

class HeadlinesInteractor: IHeadlinesInteractor {
    var presenter: IHeadlinesPresenter?
    var Worker: IHeadlinesWorker?
    var parameters: [String: Any]?

    init(presenter: IHeadlinesPresenter, Worker: IHeadlinesWorker) {
    	self.presenter = presenter
    	self.Worker = Worker
    }
    
    func getHeadlines(){
        if Reachability.isConnectedToNetwork(){
            Worker?.getHeadlines(complition: { (error, success, headlines) in
                if success {
                    guard let headlines = headlines else {
                        return
                    }
                    self.presenter?.showHeadlines(headlines: headlines)
                }
                
            })
        }
    }
}
