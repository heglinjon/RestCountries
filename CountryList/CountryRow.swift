//Created for CountryList in 2023
// Using Swift 5.0

import SwiftUI


struct CountryRow: View {
    @ObservedObject var country: CountryViewModel
    var body: some View {
        HStack {
            if let image = country.flagImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 70, height: 40)
            }
            
            VStack(alignment: .leading) {
                Text(country.name!)
                    .bold()
                    .font(.callout)
                
                Text(country.official!)
                    .bold()
                    .font(.footnote)
                    .opacity(0.8)
                
                Text(country.capital!)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

        }
        .frame(height: 80)
    }
}
