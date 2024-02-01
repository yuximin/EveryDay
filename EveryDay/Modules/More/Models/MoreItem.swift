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
    
    var id: Int {
        switch self {
        case .mortgageCalculator:
            return 0
        }
    }
    
    var title: String {
        switch self {
        case .mortgageCalculator:
            return "Mortgage Calculator"
        }
    }
    
    var detailView: some View {
        switch self {
        case .mortgageCalculator:
            return MortgageCalculatorView()
        }
    }
}
