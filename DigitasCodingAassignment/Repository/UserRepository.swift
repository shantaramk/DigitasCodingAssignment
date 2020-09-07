//
//  UserRepository.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 17/08/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import Foundation

protocol UserRepository {
    
    func create(user: CountryInfoModel)
    
    func getAll() -> [CountryInfoModel]?
    
    //func get(byIdentifier id: String) -> CountryInfoModel?
    
    //func update(user: CountryInfoModel) -> Bool
    
    //func delete(id: String) -> Bool
}
