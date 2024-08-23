//
//  DessertDetailsCellView.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import SwiftUI

struct DessertDetailsCellView: View {
    let vm: DessertViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: vm.strMealThumb) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                    .frame(width: 300, height: 300)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            Spacer()
            VStack {
                Text(vm.strInstructions)
                    .font(.headline)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(Titles.ingredientsMeasurementsTitle)
                    .font(.subheadline)
                ForEach(vm.formattedIngredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
        }
    }
}
