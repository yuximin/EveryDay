//
//  CommemorationDay.swift
//  EveryDay
//
//  Created by apple on 2024/1/16.
//

import Foundation

struct CommemorationDay {
    let id: Int
    var type: Int
    var name: String
    var date: Date
    
    var days: Int {
        let now = Date()
        let timeInterval = Int(now.timeIntervalSince1970 - self.date.timeIntervalSince1970)
        var days = timeInterval / 86400
        if timeInterval % 86400 > 0 {
            days += 1
        }
        return days
    }
}
