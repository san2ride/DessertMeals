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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                await dessertsListViewModel.getDesserts()
            }
    }
}

#Preview {
    DessertListView()
}
