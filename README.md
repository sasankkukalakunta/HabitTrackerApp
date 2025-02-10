🛠️ Habit Tracker & Shopping Cart App

A modern iOS application combining habit tracking and shopping cart management built using SwiftUI and the MVVM architecture. This app allows users to track habits, manage their daily goals, shop for products, and handle cart items all in one place.

🚀 Features

Habit Tracker
Manage daily habits with progress tracking.
Add new habits and view existing ones in a visually appealing interface.
Mark habits as complete and track their streaks.

Shopping Cart
Browse a list of products with price details.
Add products to the cart with just one tap.
View cart contents, including quantities and total cost.
Remove items or adjust quantities dynamically.

Core Functionalities
Tab-based Navigation: Switch between the habit tracker and shopping cart views effortlessly.
State Management: Shared ViewModels for a seamless and responsive experience.
Dynamic UI: Beautiful UI with gradients, animations, and responsive layouts.

🛠️ Tech Stack

SwiftUI: Declarative and modern UI framework for building the app's interface.
MVVM Architecture: Ensures separation of concerns and scalability.
State Management: Powered by @StateObject and @ObservedObject.
NavigationView: For hierarchical navigation between views.
Reusable Components: Modular design with reusable views like HabitCard and CartItem.

 📖 How It Works

MainView.swift
The MainView serves as the app's entry point and navigation controller.It uses a TabView to allow users to switch between:
Habit Tracker Tab: For managing and tracking habits.
Products Tab: For browsing products to add to the cart.
Cart Tab: For viewing and managing the cart.
Habit Tracker

Track Progress:
Users can view a list of habits they are tracking.
Each habit displays the total number of completions.

Add New Habits:
Users can add habits with a name and desired completion goals.

Mark as Complete:
Users can mark habits as completed to increment their streaks.
Shopping Cart

Browse Products:
Users can view a list of available products with prices.

Add to Cart:
Tap "Add to Cart" to add an item to the shopping cart.
Items already in the cart will have their quantities incremented.

Manage Cart:
View all items in the cart with quantities and prices.
Remove items or adjust quantities dynamically.
Total Cost Calculation:
The total cost of items in the cart is calculated in real-time.

📱 Screenshots:
<p float="left">
  <img src="https://github.com/sasankkukalakunta/HabitTrackerApp/blob/main/homeScreen_habit_tracker.png" width="200" />
  <img src="https://github.com/sasankkukalakunta/HabitTrackerApp/blob/main/Shopping%20CartView.png" width="200" />
  <img src="https://github.com/sasankkukalakunta/HabitTrackerApp/blob/main/ProductlistView.png" width="200" />
   <img src="https://github.com/sasankkukalakunta/HabitTrackerApp/blob/main/AddnewHabitView.png" width="200" />

</p>

Habit Tracker
Habit Tracker Home	Add New Habit
Shopping Cart
Product List	Cart View
