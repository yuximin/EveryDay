//
//  Habit.swift
//  EveryDay
//
//  Created by apple on 2024/1/26.
//

import Foundation

struct Habit: Identifiable {
    var id: Int
    var timeValue: Int
    var title: String
    
    var time: HabitTime? {
        HabitTime(rawValue: self.timeValue)
    }
}
