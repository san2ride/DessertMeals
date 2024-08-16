//
//  DessertListCellView.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import SwiftUI

struct DessertListCellView: View {
    let vm: DessertViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: vm.strMealThumb) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            Text(vm.strMeal)
                .font(.title)
        }
    }
}
