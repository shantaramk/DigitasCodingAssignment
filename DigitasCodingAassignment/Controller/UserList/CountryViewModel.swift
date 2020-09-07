//
//  CountryViewModel.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

protocol ViewInformationProtocol {
        
    func userList(completion: @escaping(Bool, String) -> Void)
    
}

protocol UserViewProtocol: ViewInformationProtocol {
    
}

class CountryViewModel: NSObject {
    
    var userList = [CountryInfoModel]()
    
    private let manager = CountryManager(with: UserDataRepository())
    
    var year: String {
        return ""
    }
}

//MARK:- WebServies

extension CountryViewModel: UserViewProtocol {
    
    public func userList(completion: @escaping (Bool, String) -> Void) {
        
        let userList = manager.getAll() ?? []
        
        if userList.isEmpty {
            
            UserProxy().userList(APIConfiguration(path: APIBaseUrl.url + APIEndpoint.allCountryList),
                               successCompletion: { (result) in
                                
                                self.initialzedUsersArray(result)

                                self.createUsersInfo(users: result)
                                
                                print(PersistantStorage.shared.dbPath)
                                
                                completion(true, "")
                                
                                
            }) { (error) in

                print(error)
                completion(true, "")
            }
        } else {
            
            self.initialzedUsersArray(manager.getAll() ?? [])
            
            completion(true, "")

        }
        
    }
    
}

//MARK:- Private Method

fileprivate extension CountryViewModel {
    
    func createUsersInfo(users: [CountryInfoModel]) {
        for user in users {
            manager.createUser(user: user)
        }
    }
    
    func initialzedUsersArray(_ users: [CountryInfoModel]) {
        
        self.userList = users
        
    }
}

