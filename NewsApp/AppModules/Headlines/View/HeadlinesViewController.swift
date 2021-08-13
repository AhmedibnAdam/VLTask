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
import Kingfisher


protocol IHeadlinesViewController: class {
    var router: IHeadlinesRouter? { get set }
    func showFirstFavHeadlines(headlines: HeadlinesModel.Response)
    func showSecondFavHeadlines(headlines: HeadlinesModel.Response)
    func showThirdFavHeadlines(headlines: HeadlinesModel.Response)
    
}

class HeadlinesViewController: UIViewController {
    var interactor: IHeadlinesInteractor?
    var router: IHeadlinesRouter?
    
    let headlinesNibName = "ArticlesTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var article: HeadlinesModel.Article?
    
    var favoriteArticles = [HeadlinesModel.Article]()
    
    var firstFavCategoryFiltered: [HeadlinesModel.Article] = []
    var secondFavCategoryFiltered: [HeadlinesModel.Article] = []
    var thirdFavCategoryFiltered: [HeadlinesModel.Article] = []
    
    var firstFavCategory: [HeadlinesModel.Article] = []
    var secondFavCategory: [HeadlinesModel.Article] = []
    var thirdFavCategory: [HeadlinesModel.Article] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setUpUI()
        setUpNavigation()
        registerTableCell()
        interactor?.getFirstFavorite()
        interactor?.getSecondFavorite()
        interactor?.getThirdFavorite()
        
    }
    
    @IBAction func showFavorites(_ sender: UIButton) {
        
        let unique = Array(Set(favoriteArticles))
        
        router?.navigateToFavorites(parameters: ["favorites": favoriteArticles])
        
    }
    
}

extension HeadlinesViewController: IHeadlinesViewController {
    
    func showFirstFavHeadlines(headlines: HeadlinesModel.Response){
        firstFavCategoryFiltered = headlines.articles ?? []
        firstFavCategory = headlines.articles ?? []
        
        tableView.show()
        tableView.reloadData()
        
    }
    func showSecondFavHeadlines(headlines: HeadlinesModel.Response) {
        secondFavCategoryFiltered = headlines.articles ?? []
        secondFavCategory = headlines.articles ?? []
        
        tableView.reloadData()
        
    }
    
    func showThirdFavHeadlines(headlines: HeadlinesModel.Response) {
        thirdFavCategoryFiltered = headlines.articles ?? []
        thirdFavCategory = headlines.articles ?? []
        
        tableView.reloadData()
        
    }
    
    
}

extension HeadlinesViewController {
    func setUpUI(){
        setUpNavigation()
        registerTableCell()
        extractedFunc()
        
    }
    fileprivate func extractedFunc() {
        tableView.hide()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    func setUpNavigation(){
        navigationItem.title = "Headlines"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    func registerTableCell() {
        let cell = UINib(nibName: headlinesNibName, bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: headlinesNibName)
    }
    
}

