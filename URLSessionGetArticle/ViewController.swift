//
//  ViewController.swift
//  URLSessionGetArticle
//
//  Created by Chhaileng Peng on 8/25/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let article_url = "http://35.240.238.182:8080/v1/api/articles?title=&page=2&limit=5"
        
        let url = URL(string: article_url)
        var urlRequest = URLRequest(url: url!)
//        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                
                let dict = json as! [String: Any]
                print(dict["MESSAGE"] as! String)
                
                let articles = dict["DATA"] as! NSArray
                for article in articles {
                    let article = article as! [String: Any]
                    print("ID   :", article["ID"] as! Int)
                    print("Title:", article["TITLE"] as! String)
                }
            }
        }
        
        dataTask.resume()
        
        
        
    }

}

