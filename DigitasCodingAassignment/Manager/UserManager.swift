//
//  UserManager.swift
//  MobileAxxessCodingAssignment
//
//  Created by Shantaram K on 24/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

struct UserManager {

      // The userRepository maintains a reference to an object of the User Data Repository class (As Of Now because it will change it requirement arise for core data).
    // It can be either lazy-loaded
    
    private var userRepository: UserRepository?

    //Initialized with User Respository
    
    init(with userRepository: UserRepository) {
        
        self.userRepository = userRepository
    }
    
    func createUser(user: CountryInfoModel) {
        
        userRepository?.create(user: user)
     }
    
    func getAll() -> [CountryInfoModel]? {
        return userRepository?.getAll()
    }
}
