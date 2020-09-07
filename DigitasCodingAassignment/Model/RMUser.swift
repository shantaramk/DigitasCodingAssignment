//
//  RMUser.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 24/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit
import RealmSwift

protocol RMUserInfoProtocol {

    dynamic var name: String { get set }
    dynamic var capital: String { get set }
}

class RMUser: Object, RMUserInfoProtocol {
    
    @objc dynamic var name: String = ""
    @objc dynamic var capital: String = ""
    @objc dynamic var population: Int = 0
    @objc dynamic var currencies: String = ""

    @objc dynamic var location: String = ""
    @objc dynamic var borders: String = ""
    @objc dynamic var lat: Double = 0
    @objc dynamic var lng: Double = 0
    @objc dynamic var languages: String = ""
}
