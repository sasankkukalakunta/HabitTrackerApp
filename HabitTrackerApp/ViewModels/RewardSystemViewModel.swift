//
//  RewardSystemViewModel.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import Foundation

class RewardSystemViewModel: ObservableObject {
    @Published var rewards: [Reward] = [
        Reward(title: "3-Day Streak", description: "Unlocked for completing a 3-day streak!", unlocked: false),
        Reward(title: "7-Day Streak", description: "Unlocked for completing a 7-day streak!", unlocked: false)
    ]

    func checkRewards(streakCount: Int) {
        for index in rewards.indices where rewards[index].unlocked == false {
            if (rewards[index].title.contains("3") && streakCount >= 3) ||
                (rewards[index].title.contains("7") && streakCount >= 7) {
                rewards[index].unlocked = true
            }
        }
    }
}
