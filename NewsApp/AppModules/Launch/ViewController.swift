//
//  ViewController.swift
//  VLTask
//
//  Created by Adam on 8/9/21.
//  Copyright © 2021 VL. All rights reserved.
//

import UIKit
import CountryPicker


class ViewController: UIViewController , CountryPickerDelegate{
    
    
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = (nextButton.bounds.height) / 2
        
        self.makePicker()
    }
    
    
    fileprivate func makePicker() {
        let picker = CountryPicker()
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        //init Picker
        picker.countryPickerDelegate = self
        picker.setCountry(code ?? "EG")
        countryView.addSubview(picker)
    }
    
    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        UserDefaults.standard.set(countryCode, forKey: "Country")
        
        
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        
        self.navigate(type: .modal, module: Route.cats, completion: nil)
    }
}

