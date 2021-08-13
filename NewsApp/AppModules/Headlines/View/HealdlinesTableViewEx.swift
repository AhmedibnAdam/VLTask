//
//  HealdlinesTableViewEx.swift
//  NewsApp
//
//  Created by mo3taz on 8/13/21.
//  Copyright © 2021 VL. All rights reserved.
//

import Foundation
import UIKit

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
        
        let label = UILabel.init(frame: CGRect(x: 15, y: 13, width: tableView.bounds.size.width - 10, height: 24))
        
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
