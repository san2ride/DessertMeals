//
//  DessertDetailsView.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import SwiftUI

struct DessertDetailsView: View {
    let vm: DessertViewModel
    @StateObject private var dessertListViewModel = DessertListViewModel()
    
    var body: some View {
        List(dessertListViewModel.desserts, id: \.idMeal) { vm in
            DessertDetailsCellView(vm: vm)
        }
        .listStyle(.plain)
        .task({
            await dessertListViewModel.getDessertDetails(mealId: vm.idMeal)
        })
        .navigationTitle(vm.strMeal)
    }
}
