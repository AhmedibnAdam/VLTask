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
    func showHeadlines(headlines: HeadlinesModel.Response)
    
}

class HeadlinesViewController: UIViewController {
    var interactor: IHeadlinesInteractor?
    var router: IHeadlinesRouter?
    
    let headlinesNibName = "ArticlesTableViewCell"
    var headlinesData: [HeadlinesModel.Article]?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var filteredData: [HeadlinesModel.Article]!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setUpUI()
        setUpNavigation()
        registerTableCell()
        interactor?.getHeadlines()
    }
}

extension HeadlinesViewController: IHeadlinesViewController {
    func showHeadlines(headlines: HeadlinesModel.Response){
        headlinesData = headlines.articles
        filteredData = headlinesData
        tableView.show()
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
    }
    func registerTableCell() {
        let cell = UINib(nibName: headlinesNibName, bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: headlinesNibName)
    }}

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: headlinesNibName, for: indexPath) as! ArticlesTableViewCell
        let article = filteredData?[indexPath.row]
        cell.title.text = article?.title
        cell.publishedAt.text = article?.publishedAt
        cell.shortDetails.text = article?.content
        let url = URL(string: article?.urlToImage ?? "" )
        cell.img.kf.setImage(with: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = filteredData?[indexPath.row]
        if let checkURL = URL(string: article?.url ?? "") {
            UIApplication.shared.open(checkURL,  completionHandler: nil)

        } else {
            print("Invalid URL")
        }
    }
}

extension HeadlinesViewController : UISearchBarDelegate {
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            filteredData.removeAll()
            for article in headlinesData ?? [] {
                let searchTXT = searchText.lowercased()
                let title = article.title?.lowercased()
                let content = article.title?.lowercased()
                let description = article.articleDescription?.lowercased()
                if (title?.contains(searchTXT)) ?? false ||  (content?.contains(searchTXT)) ?? false ||   (description?.contains(searchTXT)) ?? false {
                    filteredData.append(article)
                }
            }
        }
        else{
            filteredData = headlinesData
        }
        tableView.reloadData()
    }
}
