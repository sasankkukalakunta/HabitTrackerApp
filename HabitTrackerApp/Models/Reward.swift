//
//  Reward.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import Foundation

struct Reward: Identifiable, Codable {
    let id = UUID()
    var title: String
    var description: String
    var unlocked: Bool
}
