//
//  EndPointEndpoint.swift
//  NewsApp
//
//  Created by Adam on 8/11/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import Foundation
import Alamofire

enum EndPointEndpoint {
    case firstFav
    case seconfFav
    case thirdFav
    
}

extension EndPointEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        /*
         Do like this:
         
         switch self {
         case .sample:
         return .get
         }
         */
        return .get
    }
    
    var path: String {
        
        let base = Constant.base
        let v = Constant.version
        let apiKey = Constant.apiKey
        let url = "top-headlines?"
        let country =  UserDefaults.standard.string(forKey: "Country") ?? "US"
        let frist =  UserDefaults.standard.string(forKey: "favorite1") ?? "business"
        let second =  UserDefaults.standard.string(forKey: "favorite2") ?? "business"
        let third =  UserDefaults.standard.string(forKey: "favorite3") ?? "business"
        
        switch self {
        case .firstFav:
            return base + v + url + "country=\(country)&category=\(frist)&sortBy=publishedAt&apiKey=\(apiKey)"
        case .seconfFav:
            return base + v + url + "country=\(country)&category=\(second)&sortBy=publishedAt&apiKey=\(apiKey)"
        case .thirdFav:
            return base + v + url + "country=\(country)&category=\(third)&sortBy=publishedAt&apiKey=\(apiKey)"
        }
        
    }
    
    var parameter: Parameters? {
        return nil
    }
    
    var header: HTTPHeaders? {
  
        return nil
    }
    
    var encoding: ParameterEncoding {        

        return JSONEncoding.default
    }
}
