//
//  Habit.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id = UUID()
    var name: String
    var startTime: Date
    var endTime: Date
    var completedDates: [Date] // Track dates when the habit was completed
}
