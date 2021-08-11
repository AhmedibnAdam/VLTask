//
//  HeadlinesWorker.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *



import Foundation

protocol IHeadlinesWorker: class {
   func getHeadlines(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: HeadlinesModel.Response?)->Void)}

class HeadlinesWorker: IHeadlinesWorker {
    func getHeadlines(complition: @escaping (Error?, Bool, HeadlinesModel.Response?) -> Void) {
        NetworkService.share.request(endpoint: EndPointEndpoint.headlines, success: { (responseData) in
                   let response = responseData
                   do {
                       let decoder = JSONDecoder()
                    let data = try decoder.decode(HeadlinesModel.Response.self, from: response)
                       print(data)
                       complition(nil, true, data)
                       
                   } catch let error {
                       print(error)
                       complition(nil, true, nil)
                   }
                   
               }) { (error) in
                   print(error as Any)
                    complition(nil, true, nil)
               }
    }
    
}
