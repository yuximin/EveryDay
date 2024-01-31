//
//  MortgageCalculatorDetailView.swift
//  EveryDay
//
//  Created by apple on 2024/1/30.
//

import SwiftUI

struct MortgageDetailView: View {
    
    private let totalAmount: Int
    private let totalCount: Int
    private let annualizedRate: Double
    
    @State private var mortgageItems: [MortgageItem] = []
    
    init(totalAmount: Int, totalCount: Int, annualizedRate: Double) {
        self.totalAmount = totalAmount
        self.totalCount = totalCount
        self.annualizedRate = annualizedRate
    }
    
    var body: some View {
        List($mortgageItems, id: \.periods) { mortagageItem in
            MortgageDetailCell(item: mortagageItem)
        }
        .onAppear(perform: {
            calcMortgage()
        })
    }
    
    /// 计算利息
    ///
    /// A = principal * interestRate * ((1 + annualizedRate / 12) ^ numberOfPeriods) / (((1 + interestRate / 12) ^ numberOfPeriods) - 1)
    private func calcMortgage() {
        let principal = Double(self.totalAmount) * 10000
        let monthInterestRate = annualizedRate / 12
        let temp = pow(1 + monthInterestRate, Double(totalCount))
        let monthlySupply = principal * monthInterestRate * temp / (temp - 1)
        
        var items: [MortgageItem] = []
        var tempPrincipal = principal
        for index in 0..<totalCount {
            let monthlyInterest = tempPrincipal * monthInterestRate
            let monthlyPrincipal = monthlySupply - monthlyInterest
            let item = MortgageItem(periods: index + 1, amount: monthlySupply, principal: monthlyPrincipal, interest: monthlyInterest)
            items.append(item)
            tempPrincipal -= monthlyPrincipal
        }
        self.mortgageItems = items
    }
}

#Preview {
    MortgageDetailView(totalAmount: 112, totalCount: 360, annualizedRate: 0.0588)
}
