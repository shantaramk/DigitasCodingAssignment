//
//  CountryViewModel.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 23/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

protocol ViewInformationProtocol {
        
    func countryList(completion: @escaping(Bool, String) -> Void)
    
}

protocol UserViewProtocol: ViewInformationProtocol {
    
}

class CountryViewModel: NSObject {
    
    var countryList = [CountryInfoModel]()
    
    private let manager = CountryManager(with: UserDataRepository())
    
    var year: String {
        return ""
    }
}

//MARK:- WebServies

extension CountryViewModel: UserViewProtocol {
    
    public func countryList(completion: @escaping (Bool, String) -> Void) {

        if ReachabilityManager.isConnectedToNetwork() {

            print("Internet connection OK")

            let regionName = EnvironmentConfiguration().configuration(Plist.region)

            print(regionName)

            CountryProxy().countryListByRegion(APIConfiguration(path: APIEndpoint.region + regionName),
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

            print("Internet connection FAILED")

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
        
        self.countryList = users
        
    }
}

