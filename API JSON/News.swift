//
//  News.swift
//  API JSON
//
//  Created by Kelvin Tan on 7/19/18.
//  Copyright © 2018 Kelvin Tan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class News {

    private var _name: String!
    private var _author: String!
    private var _title: String!
    private var _short: String!
    private var _image: String!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var author: String {
        if _author == nil {
            _author = ""
        }
        return _author
    }
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
    var short: String {
        if _short == nil {
            _short = ""
        }
        return _short
    }
    
    var image: String {
        if _image == nil {
            _image = ""
        }
        return _image
    }
    
    func downloadNews(completed: @escaping DownloadComplete) {
        Alamofire.request(API_URL).responseJSON { (response) in
//            print(response)
            let result = response.result
            let json = JSON(result.value)
            
            self._name = json["articles"][1]["source"]["name"].stringValue
            
            self._author = json["articles"][1]["author"].stringValue
            
            self._title = json["articles"][1]["title"].stringValue
            
            self._short = json["articles"][1]["description"].stringValue
            
            self._image = json["articles"][1]["urlToImage"].stringValue
            
            completed()
        }
    }
}


