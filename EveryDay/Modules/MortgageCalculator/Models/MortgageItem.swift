//
//  MortgageItem.swift
//  EveryDay
//
//  Created by apple on 2024/1/30.
//

import Foundation

struct MortgageItem {
    var periods: Int
    var date: String
    var amount: Double
    let principal: Double
    let interest: Double
}

struct MortgageSpecialItem {
    var period: Int
    var rate: Double?
    var monthlyInterest: Double?
}
