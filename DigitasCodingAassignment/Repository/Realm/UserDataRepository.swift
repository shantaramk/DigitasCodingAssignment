//
//  UserDataRepository.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 24/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit
import RealmSwift

class UserDataRepository: UserRepository {
    
    func create(user: CountryInfoModel) {

        //Map UserInfo Model to RMUser
        let rmUser = RMUser()
        rmUser.name = user.name ?? ""
        rmUser.capital = user.capital ?? ""
        rmUser.population = user.population ?? 0

        var lat =  0.0
        var long =  0.0

        if let location = user.latlng, location.count == 0 {
            lat = 0.0
           long =   0.0
        } else {
            lat = user.latlng?[0] ?? 0.0
            long = user.latlng?[1] ?? 0.0
        }

        rmUser.lat = lat
        rmUser.lng = long

        let borders = user.borders?.joined(separator: ",")

        let languages = user.languages?.joined(separator: ",")

        let currencies = user.currencies?.joined(separator: ",")

        rmUser.currencies = currencies ?? ""

        rmUser.borders = borders ?? ""

        rmUser.languages = languages ?? ""

        do {
            //get the Realm Reference: We need to open this path whenver we want to perform CURD Operation
            let realm = PersistantStorage.shared.realm
            
            try realm?.write {
                
                realm?.add(rmUser)
            }
        } catch {
            print("error getting xml string: \(error)")
        }
    }
    
    func getAll() -> [CountryInfoModel]? {

        //    init(name: String?, capital: String?, population: Int?, currencies: String?, location: String?, borders: String?, langugaes: String?) {

        return PersistantStorage.shared.realm?.objects(RMUser.self).map {


            let borders = $0.borders.components(separatedBy: ",")

            let currencies = $0.currencies.components(separatedBy: ",")

            let languages = $0.languages.components(separatedBy: ",")

            return CountryInfoModel(name: $0.name,
                                    capital: $0.capital,
                                    population: $0.population,
                                    currencies: currencies,
                                    borders: borders,
                                    lat: $0.lat,
                                    long: $0.lng,
                                    languages: languages)
        }

    }
}
