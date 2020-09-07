//
//  APIConstant.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 25/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import Foundation
 
struct APIBaseUrl {
        
    private struct Domains {
        static let axxessTech = "https://restcountries-v1.p.rapidapi.com/"
    }
    
    static public var url = Domains.axxessTech
}

struct APIEndpoint {
    
    static let allCountryList = "all"
    
}

struct TenantId {
    
    static let axxessTech = "AxxessTech"
}
