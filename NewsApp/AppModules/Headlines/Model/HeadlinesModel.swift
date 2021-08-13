//
//  HeadlinesModel.swift
//  NewsApp
//
//  Created by Adam on 8/10/21.
//  Copyright (c) 2021 IBN ADAM. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam
//              *


import UIKit

struct HeadlinesModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}



    // MARK: - Response
    struct Response: Codable {
        let status: String?
        let totalResults: Int?
        let articles: [Article]?
    }

    // MARK: - Article
    struct Article: Codable ,Hashable, Equatable {

        let source: Source?
        let author: String?
        let title: String?
        let articleDescription: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String?
        let content: String?
        
        enum CodingKeys: String, CodingKey {
            case source, author, title
            case articleDescription = "description"
            case url, urlToImage, publishedAt, content
        }
        
        var hashValue: Int { get { return content.hashValue } }
        
        static func == (lhs: HeadlinesModel.Article, rhs: HeadlinesModel.Article) -> Bool {
            if lhs.content == rhs.content {
                return true
            }
            return false
        }
    }

    // MARK: - Source
    struct Source: Codable {
        let name: String?
    }


}
