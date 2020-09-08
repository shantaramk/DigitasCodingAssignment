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
    static let region = "region/"
}

struct TenantId {
    
    static let axxessTech = "AxxessTech"
}

enum Plist {
    case baseURL
    case region
    func value() -> String {
        switch self {
        case .baseURL:
            return "base_url"
        case .region:
            return "api_region"
        }
    }
}



struct EnvironmentConfiguration {

    func configuration(_ key: Plist) -> String {
        if let infoDict = Bundle.main.infoDictionary {
            switch key {
            case .baseURL:
                return self.baseUrlWithTenantId(infoDict[Plist.baseURL.value()] as? String ?? "")

            case .region:
                return infoDict[Plist.region.value()] as? String ?? ""
            }
        } else {
            fatalError("Unable to locate plist file")
        }
    }
    func baseUrlWithTenantId(_ baseUrl: String) -> String {
        return baseUrl.replacingOccurrences(of: "%", with: "/") + "/"
    }
}
