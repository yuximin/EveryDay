//
//  MoreItem.swift
//  EveryDay
//
//  Created by apple on 2024/1/30.
//

import Foundation
import SwiftUI

enum MoreItem: Identifiable {
    case mortgageCalculator
    case liveActivity
    
    var id: Int {
        switch self {
        case .mortgageCalculator:
            return 0
        case .liveActivity:
            return 1
        }
    }
    
    var title: String {
        switch self {
        case .mortgageCalculator:
            return "Mortgage Calculator"
        case .liveActivity:
            return "Live Activity"
        }
    }
}
