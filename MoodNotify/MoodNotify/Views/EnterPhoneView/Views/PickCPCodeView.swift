//
//  PickCPCodeView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct PickCPCodeView: View {
    @Binding var presentSheet: Bool
    @State var searchCountry: String = ""
    @Binding var countryModel: CPDataModel
    private let countries: [CPDataModel] = Bundle.main.decode("CountryNumbers.json")
    
    var body: some View {
        NavigationStack {
            List(filteredResorts) { country in
                HStack {
                    Text(country.flag)
                    Text(country.name)
                        .font(.headline)
                    Spacer()
                    Text(country.dial_code)
                        .foregroundColor(.secondary)
                }
                .onTapGesture {
                    countryModel = country
                    searchCountry = ""
                    presentSheet = false
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .presentationDetents([.medium, .large])
        .searchable(text: $searchCountry, prompt: "Your country")
    }
    
    var filteredResorts: [CPDataModel] {
            if searchCountry.isEmpty {
                return countries
            } else {
                return countries.filter { $0.name.contains(searchCountry) }
            }
        }
}

#Preview {
    PickCPCodeView(presentSheet: .constant(true), countryModel: .constant(CPDataModel.example))
}
