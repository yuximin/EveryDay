//
//  MortgageDetailCell.swift
//  EveryDay
//
//  Created by apple on 2024/1/30.
//

import SwiftUI

struct MortgageDetailCell: View {
    
    @Binding var item: MortgageItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("第\(item.periods)期：\(item.date)")
            Text("本期应还:\t\(item.amount)")
            Text("本期利息:\t\(item.interest)")
            Text("本期本金:\t\(item.principal)")
        }
    }
}

#Preview {
    @State var item: MortgageItem = MortgageItem(periods: 1, date: "2021-06-01", amount: 1290, principal: 1000, interest: 290)
    return MortgageDetailCell(item: $item)
}
