//
//  CountryListView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/26.
//

import SwiftUI
import CoreData
import LSSLibrary

struct CountryListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.warppedName)
                        }
                    }
                }
            }.onAppear(perform: load)
            Button("Add") {
//                let candy = Candy(context: viewContext)
//                candy.name = "Mars"
//                candy.origin = Country(context: viewContext)
//                candy.origin?.shortName = "UK"
//                candy.origin?.fullName = "United Kingdom"
                let candy2 = Candy(context: viewContext)
                candy2.name = "KitKat"
                candy2.origin = Country(context: viewContext)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"

                let candy3 = Candy(context: viewContext)
                candy3.name = "Twix"
                candy3.origin = Country(context: viewContext)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"

                let candy4 = Candy(context: viewContext)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: viewContext)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                try? viewContext.save()
            }
        }
    }
    func load() {
        for country in countries {
            Debug.log(country.candyArray)
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
