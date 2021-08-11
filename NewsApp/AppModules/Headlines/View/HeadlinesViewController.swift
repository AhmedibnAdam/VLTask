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

protocol IHeadlinesViewController: class {
	var router: IHeadlinesRouter? { get set }
}

class HeadlinesViewController: UIViewController {
	var interactor: IHeadlinesInteractor?
	var router: IHeadlinesRouter?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpNavigation()
        registerTableCell()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HeadlinesViewController: IHeadlinesViewController {
	// do someting...
}

extension HeadlinesViewController {
    func setUpUI(){
          setUpNavigation()
          registerTableCell()
      }
      func setUpNavigation(){
          navigationItem.title = "Headlines"
          navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          navigationController?.navigationBar.barTintColor = .black
      }
      func registerTableCell() {
          let cell = UINib(nibName: "ArticlesTableViewCell", bundle: nil)
          tableView.register(cell, forCellReuseIdentifier: "ArticlesTableViewCell")
      }}

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell", for: indexPath) as! ArticlesTableViewCell
        
        return cell
    }
    
	// do someting...
}
