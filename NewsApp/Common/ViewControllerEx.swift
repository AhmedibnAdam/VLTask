//
//  ViewController.swift
//  NewsApp
//
//  Created by Adam on 8/11/21.
//  Copyright © 2021 VL. All rights reserved.
//

import Foundation
import UIKit

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


class MyButton: UIButton{

    var myRow: Int = 0
    var mySection: Int = 0

}
