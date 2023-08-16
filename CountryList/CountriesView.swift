//Created for CountryList in 2023
// Using Swift 5.0

import Foundation
import SwiftUI


struct CountriesView: View {
    
    @StateObject var viewModel = CountriesViewModel()
    @State private var selectedCountry: CountryViewModel?
    @State private var searchText = ""
    @State private var filteredCountries = [CountryViewModel]()
    @State private var flagImage: UIImage?

    
    var body: some View {

      NavigationView {
          VStack{
              SearchBar(text: $searchText)
                  .onChange(of: searchText) {newValue in
                      viewModel.searchCountries(query: newValue)
                  }
              List(viewModel.countries.sorted(by: {
                  $0.name! < $1.name!
              })) { country in
                  NavigationLink(destination: CountryDetailView(country: country)){
                      CountryRow(country: country)
                      .onTapGesture {
                          selectedCountry = country
                      }

                  }.listRowSeparator(.hidden)
                   .onAppear {
                          country.loadFlag(for: country.country) { image in
                              country.flagImage = image
                          }
                      }
              }
              .listStyle(.plain)
              .navigationTitle("Countries")
              .navigationBarTitleDisplayMode(.inline)
          }
       }
    }
 }


struct SearchBar: View {

  @Binding var text: String
    
  var body: some View {
    HStack {
      TextField("Search", text: $text)
        .padding(7)
        .padding(.horizontal, 25)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .overlay(
          HStack {
            Image(systemName: "magnifyingglass")
              .foregroundColor(.gray)
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 8)
              
              Image(systemName: "mic.fill")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 8)

          }
        )
    }
    .padding(.horizontal)
  }
}
