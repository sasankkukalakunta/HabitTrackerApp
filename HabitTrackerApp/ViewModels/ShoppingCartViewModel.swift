//
//  ShoppingCartViewModel.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import Foundation

class ShoppingCartViewModel: ObservableObject {
    @Published var cart: [CartItem] = [] // Cart items
    @Published var products: [Product] = [ // Example products
        Product(name: "Apple", price: 1.0),
        Product(name: "Banana", price: 0.5),
        Product(name: "Orange", price: 0.8)
    ]
    
    // Add item to the cart
    func addToCart(product: Product) {
        if let index = cart.firstIndex(where: { $0.product.id == product.id }) {
            cart[index].quantity += 1
        } else {
            let cartItem = CartItem(product: product, quantity: 1)
            cart.append(cartItem)
        }
    }
    
    // Remove item from the cart
    func removeFromCart(cartItem: CartItem) {
        if let index = cart.firstIndex(where: { $0.product.id == cartItem.product.id }) {
            if cart[index].quantity > 1 {
                cart[index].quantity -= 1
            } else {
                cart.remove(at: index)
            }
        }
    }
    
    // Calculate total cost of the cart
    var totalCost: Double {
        cart.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}

// Supporting Models
struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}
