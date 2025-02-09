//
//  MainView.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//
import SwiftUI
struct MainView: View {
    @StateObject private var viewModel = HabitTrackerViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Habit Tracker")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding()
                    if viewModel.habits.isEmpty {
                        PlaceholderIllustration(text: "No habits added yet!")
                    } else {
                        ScrollView {
                            ForEach(viewModel.habits) { habit in
                                HabitCard(habit: habit, viewModel: viewModel)
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                            }
                        }
                    }
                    NavigationLink(destination: AddHabitView(viewModel: viewModel)) {
                        Text("Add New Habit")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                    NavigationLink(destination: CartView(viewModel: ShoppingCartViewModel())) {
                        Text("REMOVE ALL")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                    NavigationLink(destination: ProductListView(viewModel: ShoppingCartViewModel())) {
                        Text("ADD TO CART")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                }
            }
        }
    }
    // Placeholder for illustrations
    struct PlaceholderIllustration: View {
        var text: String
        
        var body: some View {
            VStack {
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 150, height: 150)
                    .overlay(
                        Image(systemName: "pencil.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    )
                Text(text)
                    .foregroundColor(.white.opacity(0.7))
                    .font(.headline)
                    .padding(.top, 10)
            }
        }
    }
    // Card for displaying habits
    struct HabitCard: View {
        let habit: Habit
        @ObservedObject var viewModel: HabitTrackerViewModel
        var body: some View {
            VStack(alignment: .leading) {
                Text(habit.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Completed: \(habit.completedDates.count) times")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                HStack {
                    Spacer()
                    Button(action: { viewModel.completeHabit(habit) }) {
                        Text("Mark Complete")
                            .font(.caption)
                            .padding(8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .background(Color.black.opacity(0.3))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
        }
    }
    struct ShoppingCartApp: App {
        var body: some Scene {
            WindowGroup {
                TabView {
                    ProductListView(viewModel: ShoppingCartViewModel())
                        .tabItem {
                            Image(systemName: "cart.fill")
                            Text("Products")
                        }
                    CartView(viewModel: ShoppingCartViewModel())
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                }
            }
        }
    }
}
#Preview {
    MainView()
}

