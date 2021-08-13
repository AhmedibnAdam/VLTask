//
//  SearchBarEx.swift
//  NewsApp
//
//  Created by Adam on 8/13/21.
//  Copyright © 2021 VL. All rights reserved.
//

import Foundation
import UIKit

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
