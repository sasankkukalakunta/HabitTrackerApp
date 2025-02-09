//
//  CartView.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: ShoppingCartViewModel
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.cart.isEmpty {
                    Text("Your cart is empty!")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.cart) { cartItem in
                            HStack {
                                // Product Name
                                Text(cartItem.product.name)
                                    .font(.headline)
                                
                                Spacer()
                                
                                // Quantity
                                Text("x\(cartItem.quantity)")
                                    .font(.subheadline)
                                
                                Spacer()
                                
                                // Price
                                Text("$\(cartItem.product.price * Double(cartItem.quantity), specifier: "%.2f")")
                                    .font(.subheadline)
                                
                                Spacer()
                                
                                // Remove Button
                                Button(action: {
                                    viewModel.removeFromCart(cartItem: cartItem)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    // Total Cost at the Bottom
                    HStack {
                        Text("Total:")
                            .font(.headline)
                        Spacer()
                        Text("$\(viewModel.totalCost, specifier: "%.2f")")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
            }
            .navigationTitle("Shopping Cart")
        }
    }
}
#Preview {
    CartView(viewModel:ShoppingCartViewModel())
}
