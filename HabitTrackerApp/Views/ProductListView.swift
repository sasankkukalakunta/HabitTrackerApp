//
//  ProductListView.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ShoppingCartViewModel

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                HStack {
                    Text(product.name)
                        .font(.headline)
                    Spacer()
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                    Spacer()
                    Button(action: {
                        viewModel.addToCart(product: product)
                    }) {
                        Text("Add to Cart")
                            .padding(8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Products")
        }
    }
}
#Preview {
    ProductListView(viewModel:  ShoppingCartViewModel())
}
