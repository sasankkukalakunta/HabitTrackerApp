//
//  HabitTrackerViewModel.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import SwiftUI

class HabitTrackerViewModel: ObservableObject {
    @Published var habits: [Habit] = []

    func addHabit(name: String, startTime: Date, endTime: Date) {
        let newHabit = Habit(name: name, startTime: startTime, endTime: endTime, completedDates: [])
        habits.append(newHabit)
        saveHabits()
    }

    func completeHabit(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].completedDates.append(Date())
            saveHabits()
        }
    }

    private func saveHabits() {
        if let encodedData = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encodedData, forKey: "habits")
        }
    }

    func loadHabits() {
        if let savedData = UserDefaults.standard.data(forKey: "habits"),
           let loadedHabits = try? JSONDecoder().decode([Habit].self, from: savedData) {
            habits = loadedHabits
        }
    }

    init() {
        loadHabits()
    }
}
