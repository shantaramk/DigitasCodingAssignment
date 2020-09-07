//
//  APIClient.swift
//  MobileAxxessCodingAssignment

//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

protocol Requestable {
    
    func performRequest<T: Decodable>(route: APIConfiguration,
                                                successCompletion:@escaping (T) -> Void,
                                                failureCompletion:@escaping (Error) -> Void)
}

class APIClient: NSObject, Requestable {
    
    func performRequest<T: Decodable>(route: APIConfiguration,
                                             successCompletion:@escaping (T) -> Void,
                                             failureCompletion:@escaping (Error) -> Void)  {

        let headers = [
            "x-rapidapi-host": "restcountries-v1.p.rapidapi.com",
            "x-rapidapi-key": "475eebcce4msh1e04982ca510f1bp148de4jsn7d672619f9c0",
            "useQueryString": "true"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: route.path!)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10000.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            DispatchQueue.main.sync {
                
                if (error == nil) {
                    
                    do {
                        let decoder = JSONDecoder()
                        
                        let result = try decoder.decode(T.self, from: data!)
                        
                        successCompletion(result)
                        
                    } catch let error {
                        
                        failureCompletion(error)
                    }
                    
                }
            }
       
        })
        
        dataTask.resume()
    }
}


struct APIConfiguration {
    
     var path: String?
}
