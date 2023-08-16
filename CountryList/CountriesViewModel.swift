//Created for CountryList in 2023
// Using Swift 5.0

import Foundation
import SwiftUI

class CountriesViewModel: ObservableObject {
    
    @Published var countries = [CountryViewModel]()
    
    init() {
        fetchCountries()
    }
    
    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let jsonCountries = try decoder.decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.countries = jsonCountries.map(CountryViewModel.init)
                }
            }
            catch let error {
                print(error)
            }
        }.resume()
    }
    
    func searchCountries(query: String) {
        guard let url = URL(string: "https://restcountries.com/v3.1/name/\(query)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            let decoder = JSONDecoder()
            do {
                ///Here I did not use try? because I need to debug for possible conflicts in data structure of Model
                let jsonCountries = try decoder.decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.countries = jsonCountries.map(CountryViewModel.init)
                }
            }
            catch let error {
                print(error)
            }
        }.resume()
        
    }
}

class CountryViewModel : Identifiable, ObservableObject {
    
    @Published var country: Country
    @Published var flagImage: UIImage?
    @Published var countryDetails: Country

    
    init(country: Country) {
        self.country = country
        self.countryDetails = country
    }
    
    let id = UUID()
    
    var name: String? {
        country.name.common ?? "common_name"
    }
    
    var official: String? {
        country.name.official ?? "{official_name}"
    }
    
    var capital: String? {
        country.capital?[0] ?? "{capital}"
    }
    
    var region: String? {
        country.region ?? "{region}"
    }
    
    var subregion: String? {
        country.subregion ?? "{subregion}"
    }
    
    var langs: [String] {
        return Array(country.languages!.values)
    }
    
    var population : Int{
        return country.population ?? 0
    }
    
    var driverSide : String {
        return country.car.side ?? "Not specified"
    }
    
    var coat: String {
        return country.coatOfArms!.png ?? ""
    }
//    var currencies: [String:String] {
//        ForEach(country.currencies.keys, id:\.self) { key in
//          Text("\(key) (\(country.currencies[key]!.name))")
//        }
//        return country.currencies
//    }
    
    func loadFlag(for country: Country, completionHandler: @escaping (UIImage) -> Void) {
        let placeholderImage = UIImage(systemName: "rectangle.fill")!
        let queue = DispatchQueue.global()
        
        queue.async {
            
            guard let url = URL(string: country.flags.png),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                    completionHandler(placeholderImage)
                    return
            }
            
            DispatchQueue.main.async {
                completionHandler(image)
            }
        }
    }
    
    func fetchCountryDetails() {
      guard let url = URL(string: "https://restcountries.com/v3.1/name/\(country.name)") else {
        return
      }
      
      URLSession.shared.dataTask(with: url) { data, _, error in
        if let error = error {
          print("Error fetching country details: \(error.localizedDescription)")
          return
        }
        
        if let data = data {
          do {
            let decoder = JSONDecoder()
              self.countryDetails = try decoder.decode([Country].self, from: data).first!
          } catch {
            print("Error decoding country details: \(error.localizedDescription)")
          }
        }
      }.resume()
    }
    
    func loadCoat(for country: CountryViewModel, completionHandler: @escaping (UIImage) -> Void) {
        let placeholderImage = UIImage(systemName: "rectangle.fill")!
        let queue = DispatchQueue.global()
        
        queue.async {
            
            guard let url = URL(string: country.coat),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                completionHandler(placeholderImage)
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(image)
            }
        }
    }
}

