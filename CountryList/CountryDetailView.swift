//Created for CountryList in 2023
// Using Swift 5.0

import SwiftUI

struct CountryDetailView: View {
    
  @ObservedObject var country: CountryViewModel
  @State private var countryDetails: Country?
  @State private var flagImage: UIImage?
  @State private var coatImage: UIImage?


    
  var body: some View {
      VStack(alignment: .leading) {
        if let image2 = flagImage {
            Image(uiImage: image2)
                .resizable()
                .frame(width: 110, height: 60)
        }
        HStack {
            Text(country.name!)
                .font(.title).bold()
                .frame(alignment: .leading)
                .lineLimit(1)
                .minimumScaleFactor(0.01)
            Text(country.official!)
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
                .lineLimit(1)
                .minimumScaleFactor(0.01)
        } .padding(2)

        HStack {
            Text("Capital - ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
            Text(country.capital!)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(alignment: .leading)
        } .padding(2)

        HStack {
            Text("Region - ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
            Text(country.region!)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(alignment: .leading)
        } .padding(2)

        HStack {
            Text("Subregion - ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
            Text(country.subregion!)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(alignment: .leading)
        }.padding(2)
        HStack {
            Text("Languages - ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
            Text((country.langs).joined(separator: ", "))
               .multilineTextAlignment(.trailing)
               .font(.subheadline)
               .foregroundColor(.gray)
               .frame(alignment: .leading)
        }.padding(2)
        HStack {
            Text("Currencies - ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)            
//            ForEach(country.currencies.keys, id:\.self) { key in
//              Text("\(key) (\(country.currencies[key]!.name))")
//            }
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(alignment: .leading)
        }.padding(2)
        HStack {
            Text("Population - ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
            Text(String(country.population))
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(alignment: .leading)
        }.padding(2)
        HStack {
            Text("Car Driver Side - ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
            Text(country.driverSide)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(alignment: .leading)
        }.padding(2)
        VStack {
            Text("Coat of Arms ")
                .font(.subheadline)
                .foregroundColor(.gray).bold()
                .frame(alignment: .leading)
            if let image2 = coatImage {
                Image(uiImage: image2)
                    .resizable()
                    .frame(width: 70, height: 70)
            }
        }

    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .onAppear{
        country.loadFlag(for: country.country) { image in
            flagImage = image
        }
        country.loadCoat(for: country) { image3 in
            coatImage = image3
        }
    }
    .padding(.all)
    .navigationBarTitle(Text(country.name!), displayMode: .inline)
      Spacer()
  }
    

}
