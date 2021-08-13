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
import Kingfisher

protocol IFavoritesViewController: class {
    var router: IFavoritesRouter? { get set }
}

class FavoritesViewController: UIViewController {
    var interactor: IFavoritesInteractor?
    var router: IFavoritesRouter?
    var parameters: [String: Any]?
    lazy var back: UIBarButtonItem = {
        return UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
    }()
    
    var favoriteArticles = [HeadlinesModel.Article]()
    
    let headlinesNibName = "ArticlesTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        favoriteArticles = parameters?["favorites"] as! [HeadlinesModel.Article]
        setUpUI()
        setUpNavigation()
        registerTableCell()
    }
    
    @objc func backAction() {
        self.dismiss()
    }
}


extension FavoritesViewController: IFavoritesViewController {
    
    
}





extension FavoritesViewController {
    func setUpUI(){
        setUpNavigation()
        registerTableCell()
        if favoriteArticles.isEmpty {
            tableView.hide()
        }
        else{
            tableView.show()
            tableView.reloadData()
        }
    }
    
    
    func setUpNavigation(){
        navigationItem.title = "Favorites"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.setLeftBarButton(back, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    func registerTableCell() {
        let cell = UINib(nibName: headlinesNibName, bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: headlinesNibName)
    }
    
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArticles.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: headlinesNibName, for: indexPath) as! ArticlesTableViewCell
        
        let article = favoriteArticles[indexPath.row]
        
        
        cell.source.text = article.source?.name
        cell.title.text = article.title
        cell.publishedAt.text = article.publishedAt
        cell.shortDetails.text = article.content
        let url = URL(string: article.urlToImage ?? "" )
        cell.img.kf.setImage(with: url)
        cell.favoriteArticle.setImage(UIImage(named: "heart"), for: .normal)
        cell.favoriteArticle.mySection = indexPath.section
        cell.favoriteArticle.myRow = indexPath.row
        cell.favoriteArticle.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        return cell
    }
    
    @objc func handleAction(sender: MyButton){
        favoriteArticles.remove(at: sender.myRow)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = favoriteArticles[indexPath.row]
        if let checkURL = URL(string: article.url ?? "") {
            UIApplication.shared.open(checkURL,  completionHandler: nil)
            
        } else {
            print("Invalid URL")
        }
    }
    
    
}

extension FavoritesViewController : UISearchBarDelegate {
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            favoriteArticles.removeAll()
            let favorites = parameters?["favorites"] as! [HeadlinesModel.Article]
            for article in favorites {
                let searchTXT = searchText.lowercased()
                let title = article.title?.lowercased()
                let content = article.title?.lowercased()
                let description = article.articleDescription?.lowercased()
                if (title?.contains(searchTXT)) ?? false ||  (content?.contains(searchTXT)) ?? false ||   (description?.contains(searchTXT)) ?? false {
                    favoriteArticles.append(article)
                }
            }
        }
        else {
            favoriteArticles = parameters?["favorites"] as! [HeadlinesModel.Article]
        }
        
        tableView.reloadData()
    }
}

