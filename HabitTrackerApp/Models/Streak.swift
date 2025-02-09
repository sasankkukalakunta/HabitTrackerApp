//
//  Streak.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import Foundation

struct Streak: Identifiable, Codable {
    let id = UUID()
    var habitId: UUID
    var count: Int // Number of consecutive days the habit was completed
}
