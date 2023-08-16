//Created for CountryList in 2023
// Using Swift 5.0

import Foundation

struct Country: Decodable {
    let name: Name
    let capital: [String]?
    let flags: Flags
    let population: Int?
    let region: String?
    let subregion: String?
    let languages: [String:String]?
    let car: Car
    let coatOfArms: CoatOfArms?
 //   let currencies: [String:Currency]
}

struct Name: Decodable {
    let common: String?
    let official: String?
}

struct Currency: Decodable {
  let name: String
  let symbol: String
}


struct Flags: Decodable {
  let png: String
}

struct Car: Decodable {
  let side: String?
}

struct CoatOfArms: Decodable {
  let png: String?
}
