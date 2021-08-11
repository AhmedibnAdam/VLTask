//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

protocol ICategoriesViewController: class {
    var router: ICategoriesRouter? { get set }
}

class CategoriesViewController: UIViewController {
    var interactor: ICategoriesInteractor?
    var router: ICategoriesRouter?
    
    let options = ["business", "entertainment", "general", "health", "science" , "sports" , "technology" ]
    var favCats = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         nextButton.layer.cornerRadius = (nextButton.bounds.height) / 2
        registerTableCell()
        
    }
    
    @IBAction func resetFav(_ sender: Any) {
        favCats.removeAll()
        tableView.reloadData()
    }
    
    @IBAction func navigateToHeadlines(_ sender: UIButton) {
        
        if favCats.count >= 1 {
            router?.navigateToHeadlines()
        }
    }
    
}

extension CategoriesViewController: ICategoriesViewController {
    // do someting...
}

extension CategoriesViewController : UITableViewDelegate , UITableViewDataSource {
    func registerTableCell() {
        let cell = UINib(nibName: "CatsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CatsTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatsTableViewCell", for: indexPath) as! CatsTableViewCell
        cell.textLabel?.isHidden = false
        cell.textLabel?.text = options[indexPath.row]
        cell.img.isHidden = true
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CatsTableViewCell
        if favCats.count < 3 {
            cell.img.isHidden = false
            cell.img.image = UIImage(named: "heart")
            favCats.append(options[indexPath.row])
        }
        
    }
}

extension CategoriesViewController {
    // do someting...
}
