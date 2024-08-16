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
        ScrollView {
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
                    Text(vm.strIngredient1)
                        .font(.subheadline)
                    Text(vm.strMeasure1)
                        .font(.subheadline)
                }
            }
        }
    }
}
