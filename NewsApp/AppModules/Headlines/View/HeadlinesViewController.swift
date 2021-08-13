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
    }}

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
        //        headerView.backgroundColor = .black
        
        let label = UILabel.init(frame: CGRect(x: 15, y: 13, width: tableView.bounds.size.width - 10, height: 24))
        //        label.textColor = .white
        
        switch section {
        case 0:
            label.text =  UserDefaults.standard.string(forKey: "favorite1")
            headerView.addSubview(label)
            
        case 1:
            label.text =  UserDefaults.standard.string(forKey: "favorite2")
            headerView.addSubview(label)
            
        case 2:
            label.text =  UserDefaults.standard.string(forKey: "favorite3")
            headerView.addSubview(label)
        default:
            print("")
        }
        
        label.font = UIFont (name: "OpenSans-Semibold", size: 32)
        label.textColor = UIColor.white
        headerView.addSubview(label)
        headerView.backgroundColor = UIColor.black
        
        
        return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return firstFavCategoryFiltered.count
        case 1:
            return secondFavCategoryFiltered.count
        case 2:
            return thirdFavCategoryFiltered.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: headlinesNibName, for: indexPath) as! ArticlesTableViewCell
        
        switch indexPath.section {
        case 0:
            article = firstFavCategoryFiltered[indexPath.row]
            cell.favoriteArticle.mySection = indexPath.section
            cell.favoriteArticle.myRow = indexPath.row
            cell.favoriteArticle.addTarget(self, action: #selector(handleAction), for: .touchUpInside)

        case 1:
            article = secondFavCategoryFiltered[indexPath.row]
            cell.favoriteArticle.mySection = indexPath.section
            cell.favoriteArticle.myRow = indexPath.row
            cell.favoriteArticle.addTarget(self, action: #selector(handleAction), for: .touchUpInside)

        case 2:
            article = thirdFavCategoryFiltered[indexPath.row]
            cell.favoriteArticle.mySection = indexPath.section
            cell.favoriteArticle.myRow = indexPath.row
            cell.favoriteArticle.addTarget(self, action: #selector(handleAction), for: .touchUpInside)

        default:
            print("")
        }
        cell.source.text = article?.source?.name
        cell.title.text = article?.title
        cell.publishedAt.text = article?.publishedAt
        cell.shortDetails.text = article?.content
        let url = URL(string: article?.urlToImage ?? "" )
        cell.img.kf.setImage(with: url)
        return cell
    }
    
    @objc func handleAction(sender: MyButton){
        if !sender.isSelected {
            
            switch sender.mySection {
            case 0:
                favoriteArticles.append(firstFavCategoryFiltered[sender.myRow])
            case 1:
                favoriteArticles.append(secondFavCategoryFiltered[sender.myRow])
            case 2:
                favoriteArticles.append(thirdFavCategoryFiltered[sender.myRow])
            default:
                print("")
            }
            sender.setImage(UIImage(named: "heart"), for: .normal)
        }
        else {
            sender.setImage(UIImage(named: "grayHeart"), for: .normal)
            switch sender.mySection {
            case 0:
                article = firstFavCategoryFiltered[sender.myRow]
            case 1:
                article = secondFavCategoryFiltered[sender.myRow]
            case 2:
                article = thirdFavCategoryFiltered[sender.myRow]
            default:
                print("")
            }
            for (index, element) in favoriteArticles.enumerated() {
                if element.title == article?.title {
                    favoriteArticles.remove(at: index)
                }
            }
        }
        sender.isSelected = !sender.isSelected
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            article = firstFavCategoryFiltered[indexPath.row]
        case 1:
            article = secondFavCategoryFiltered[indexPath.row]
        case 2:
            article = thirdFavCategoryFiltered[indexPath.row]
        default:
            print("")
        }
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
            firstFavCategoryFiltered.removeAll()
            secondFavCategoryFiltered.removeAll()
            thirdFavCategoryFiltered.removeAll()
            
            for article in firstFavCategory {
                let searchTXT = searchText.lowercased()
                let title = article.title?.lowercased()
                let content = article.title?.lowercased()
                let description = article.articleDescription?.lowercased()
                if (title?.contains(searchTXT)) ?? false ||  (content?.contains(searchTXT)) ?? false ||   (description?.contains(searchTXT)) ?? false {
                    firstFavCategoryFiltered.append(article)
                }
            }
            for article in secondFavCategory {
                let searchTXT = searchText.lowercased()
                let title = article.title?.lowercased()
                let content = article.title?.lowercased()
                let description = article.articleDescription?.lowercased()
                if (title?.contains(searchTXT)) ?? false ||  (content?.contains(searchTXT)) ?? false ||   (description?.contains(searchTXT)) ?? false {
                    secondFavCategoryFiltered.append(article)
                }
            }
            for article in thirdFavCategory {
                let searchTXT = searchText.lowercased()
                let title = article.title?.lowercased()
                let content = article.title?.lowercased()
                let description = article.articleDescription?.lowercased()
                if (title?.contains(searchTXT)) ?? false ||  (content?.contains(searchTXT)) ?? false ||   (description?.contains(searchTXT)) ?? false {
                    thirdFavCategoryFiltered.append(article)
                }
            }
        }
        else {
            firstFavCategoryFiltered = firstFavCategory
            secondFavCategoryFiltered = secondFavCategory
            thirdFavCategoryFiltered = thirdFavCategory
        }
        
        tableView.reloadData()
    }
}
