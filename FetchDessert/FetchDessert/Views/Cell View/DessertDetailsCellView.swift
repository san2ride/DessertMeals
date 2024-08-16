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
            ScrollView(.horizontal) {
                VStack(alignment: .leading) {
                    Text(Titles.ingredientsTitle)
                        .font(.largeTitle)
                    Text(vm.strIngredient1)
                    Text(vm.strIngredient2)
                    Text(vm.strIngredient3)
                    Text(vm.strIngredient4)
                    Text(vm.strIngredient5)
                    Text(vm.strIngredient6)
                    Text(vm.strIngredient7)
                    Text(vm.strIngredient8)
                    Text(vm.strIngredient9)
                    Text(vm.strIngredient10)
                    Text(vm.strIngredient11)
                    Text(vm.strIngredient12)
                    Text(vm.strIngredient13)
                    Text(vm.strIngredient14)
                    Text(vm.strIngredient15)
                    Text(vm.strIngredient16)
                    Text(vm.strIngredient17)
                    Text(vm.strIngredient18)
                    Text(vm.strIngredient19)
                    Text(vm.strIngredient20)
                }
                VStack(alignment: .leading) {
                    Text(Titles.measurementTitle)
                        .font(.largeTitle)
                    Text(vm.strMeasure1)
                    Text(vm.strMeasure2)
                    Text(vm.strMeasure3)
                    Text(vm.strMeasure4)
                    Text(vm.strMeasure5)
                    Text(vm.strMeasure6)
                    Text(vm.strMeasure7)
                    Text(vm.strMeasure8)
                    Text(vm.strMeasure9)
                    Text(vm.strMeasure10)
                    Text(vm.strMeasure11)
                    Text(vm.strMeasure12)
                    Text(vm.strMeasure13)
                    Text(vm.strMeasure14)
                    Text(vm.strMeasure15)
                    Text(vm.strMeasure16)
                    Text(vm.strMeasure17)
                    Text(vm.strMeasure18)
                    Text(vm.strIngredient19)
                    Text(vm.strIngredient20)
                }
            }
        }
    }
}

/*
//MARK: Work In Progress
Text("Ingredients/Measurements")
    .font(.subheadline)
ForEach(vm.formattedIngredients, id: \.self) { ingredient in
    Text(ingredient)
}
*/
