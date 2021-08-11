//
//  EndPointEndpoint.swift
//  NewsApp
//
//  Created by mo3taz on 8/11/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import Foundation
import Alamofire

enum EndPointEndpoint {
     case headlines
    
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
        let category =  UserDefaults.standard.string(forKey: "category") ?? "business"
        
        
        switch self {
        case .headlines:
            return base + v + url + "country=\(country)&category=\(category)&sortBy=publishedAt&apiKey=\(apiKey)"
        }
   
    }
    
    var parameter: Parameters? {
        /*
        Do like this:

        switch self {
        case .sample(let model):
            return model.parameter()
        }
        */
        return nil
    }
    
    var header: HTTPHeaders? {
        /*
        Do like this:

        switch self {
        case .sample:
            return ["key": Any]
        }
        */
        return nil
    }
    
    var encoding: ParameterEncoding {        
        /*
        Do like this:
        
        return URLEncoding.queryString for URL Query
        
        switch self {
        case .sample:
            return JSONEncoding.default
        }
        */
        return JSONEncoding.default
    }
}
