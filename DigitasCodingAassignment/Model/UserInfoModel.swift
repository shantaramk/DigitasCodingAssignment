
import Foundation


class CountryInfoModel: Codable {
    var name: String?
    var topLevelDomain: [String]?
    var alpha2Code: String?
    var alpha3Code: String?
    var callingCodes: [String]?
    var capital: String?
    var altSpellings: [String]?
    var region: String?
    var subregion: String?
    var population: Int?
    var latlng: [Double]?
    var demonym: String?
    var area: Double?
    var gini: Double?
    var timezones: [String]?
    var borders: [String]?
    var nativeName: String?
    var numericCode: String?
    var currencies: [String]?
    var languages: [String]?
    var translations: Translations?
    var relevance: String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case topLevelDomain = "topLevelDomain"
        case alpha2Code = "alpha2Code"
        case alpha3Code = "alpha3Code"
        case callingCodes = "callingCodes"
        case capital = "capital"
        case altSpellings = "altSpellings"
        case region = "region"
        case subregion = "subregion"
        case population = "population"
        case latlng = "latlng"
        case demonym = "demonym"
        case area = "area"
        case gini = "gini"
        case timezones = "timezones"
        case borders = "borders"
        case nativeName = "nativeName"
        case numericCode = "numericCode"
        case currencies = "currencies"
        case languages = "languages"
        case translations = "translations"
        case relevance = "relevance"
    }

    required init(from decoder: Decoder) throws {
        var values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        topLevelDomain = try values.decodeIfPresent([String].self, forKey: .topLevelDomain)
        alpha2Code = try values.decodeIfPresent(String.self, forKey: .alpha2Code)
        alpha3Code = try values.decodeIfPresent(String.self, forKey: .alpha3Code)
        callingCodes = try values.decodeIfPresent([String].self, forKey: .callingCodes)
        capital = try values.decodeIfPresent(String.self, forKey: .capital)
        altSpellings = try values.decodeIfPresent([String].self, forKey: .altSpellings)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        subregion = try values.decodeIfPresent(String.self, forKey: .subregion)
        population = try values.decodeIfPresent(Int.self, forKey: .population)
        latlng = try values.decodeIfPresent([Double].self, forKey: .latlng)
        demonym = try values.decodeIfPresent(String.self, forKey: .demonym)
        area = try values.decodeIfPresent(Double.self, forKey: .area)
        gini = try values.decodeIfPresent(Double.self, forKey: .gini)
        timezones = try values.decodeIfPresent([String].self, forKey: .timezones)
        borders = try values.decodeIfPresent([String].self, forKey: .borders)
        nativeName = try values.decodeIfPresent(String.self, forKey: .nativeName)
        numericCode = try values.decodeIfPresent(String.self, forKey: .numericCode)
        currencies = try values.decodeIfPresent([String].self, forKey: .currencies)
        languages = try values.decodeIfPresent([String].self, forKey: .languages)
        translations = try values.decodeIfPresent(Translations.self, forKey: .translations)
        relevance = try values.decodeIfPresent(String.self, forKey: .relevance)
    }

    init(name: String?, capital: String?, population: Int?, currencies: [String]?, borders: [String]?, lat: Double?, long: Double?, languages: [String]?) {

        self.name = name
        self.capital = capital
        self.population = population
        self.currencies = currencies
        self.latlng = [Double]()
        latlng?.append(lat!)
        latlng?.append(long!)
        self.borders = borders
        self.languages = languages
    }
}

struct Translations: Codable {
    var de: String?
    var es: String?
    var fr: String?
    var ja: String?
    var it: String?

    enum CodingKeys: String, CodingKey {

        case de = "de"
        case es = "es"
        case fr = "fr"
        case ja = "ja"
        case it = "it"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        de = try values.decodeIfPresent(String.self, forKey: .de)
        es = try values.decodeIfPresent(String.self, forKey: .es)
        fr = try values.decodeIfPresent(String.self, forKey: .fr)
        ja = try values.decodeIfPresent(String.self, forKey: .ja)
        it = try values.decodeIfPresent(String.self, forKey: .it)
    }

}
