//
//  DessertListView.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import SwiftUI

struct DessertListView: View {
    @StateObject private var dessertsListViewModel = DessertListViewModel()
    
    var body: some View {
        NavigationStack {
            List(dessertsListViewModel.desserts, id: \.idMeal) { vm in
                NavigationLink(destination: DessertDetailsView(vm: vm)) {
                    DessertListCellView(vm: vm)
                }
                .listStyle(.plain)
            }
            .navigationTitle(Titles.dessertListTitle)
        }
        .task {
            await dessertsListViewModel.getDesserts()
        }
    }
}

#Preview {
    DessertListView()
}
