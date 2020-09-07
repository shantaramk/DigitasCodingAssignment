//
//  UserProxy.swift
//  DigitasCodingAssignment

//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class UserProxy {
    
    // The Proxy maintains a reference to an object of the APIClient class.
    // It can be either lazy-loaded or passed to the Proxy by the client.
    
    lazy private var apiClient: APIClient = APIClient()

    //Check whether client object has access to a resource
    func checkHasAccessControl(_ apiConfiguration: APIConfiguration) -> Bool {
        
        if let path = apiConfiguration.path, path != "" {
            return true
        }
        return false
    }
    
    func userList(_ apiConfiguration: APIConfiguration, successCompletion: @escaping ([CountryInfoModel]) -> Void, failureCompletion: @escaping (Error) -> Void) {
        
        if checkHasAccessControl(apiConfiguration) {
            
            apiClient.performRequest(route: apiConfiguration, successCompletion: { (result) in
                
                successCompletion(result)
                
            }, failureCompletion: { (error) in
                
                failureCompletion(error)
            })
        }

    }
    
}
