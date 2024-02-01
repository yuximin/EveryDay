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
    
    /// 首期时间
    ///
    /// 2021年6月1号
    private var startDate: Date = Date(timeIntervalSince1970: 1622476800)
    
    private var mortgageSpecialItems = [
        MortgageSpecialItem(period: 21, rate: 0.0553),
        MortgageSpecialItem(period: 29, rate: 0.0553, monthlyInterest: 4778.54),
        MortgageSpecialItem(period: 30, rate: 0.043)
    ]
    
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
    
    private func calcMortgage() {
        var currentPrincipal = Double(self.totalAmount) * 10000
        var monthlyRate = self.annualizedRate / 12
        var monthlySupply = self.calcMonthlySupply(principal: currentPrincipal, numberOfPeriods: self.totalCount, monthlyRate: monthlyRate)
        var items: [MortgageItem] = []
        for index in 1...self.totalCount {
            var specialMonthlyInterest: Double?
            for mortgageChangeItem in mortgageSpecialItems {
                if mortgageChangeItem.period == index {
                    if let rate = mortgageChangeItem.rate {
                        monthlyRate = rate / 12
                        monthlySupply = self.calcMonthlySupply(principal: currentPrincipal, numberOfPeriods: self.totalCount - index + 1, monthlyRate: monthlyRate)
                    }
                    specialMonthlyInterest = mortgageChangeItem.monthlyInterest
                }
            }
            
            let monthlyInterest = specialMonthlyInterest ?? (currentPrincipal * monthlyRate)
            let monthlyPrincipal = monthlySupply - monthlyInterest
            let dateString = self.dateStringOfPeriods(index)
            let item = MortgageItem(periods: index, date: dateString, amount: monthlySupply, principal: monthlyPrincipal, interest: monthlyInterest)
            items.append(item)
            currentPrincipal -= monthlyPrincipal
        }
        self.mortgageItems = items
    }
    
    /// 计算月供
    ///
    /// A = principal * monthlyRate * ((1 + monthlyRate) ^ numberOfPeriods) / (((1 + monthlyRate) ^ numberOfPeriods) - 1)
    private func calcMonthlySupply(principal: Double, numberOfPeriods: Int, monthlyRate: Double) -> Double {
        let temp = pow(1 + monthlyRate, Double(numberOfPeriods))
        let monthlySupply = principal * monthlyRate * temp / (temp - 1)
        return monthlySupply
    }
    
    private func dateStringOfPeriods(_ periods: Int) -> String {
        guard let date = Calendar.current.date(byAdding: .month, value: periods - 1, to: self.startDate) else {
            return "--"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    MortgageDetailView(totalAmount: 112, totalCount: 360, annualizedRate: 0.0588)
}
