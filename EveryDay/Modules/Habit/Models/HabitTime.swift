//
//  HabitTime.swift
//  EveryDay
//
//  Created by apple on 2024/1/26.
//

import Foundation

enum HabitTime: Int, CaseIterable, Identifiable {
    case wakeup
    case morning
    case noon
    case afternoon
    case night
    case bedtime
    
    var id: Int { self.rawValue }
    
    var title: String {
        switch self {
        case .wakeup:
            return "起床"
        case .morning:
            return "上午"
        case .noon:
            return "中午"
        case .afternoon:
            return "下午"
        case .night:
            return "晚上"
        case .bedtime:
            return "睡前"
        }
    }
}
