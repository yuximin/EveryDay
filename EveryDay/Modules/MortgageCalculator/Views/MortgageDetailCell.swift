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
            Text("当前期数:\t\(item.periods)")
//                .frame(maxWidth: .infinity)
            Text("本期应还:\t\(item.amount)")
//                .frame(maxWidth: .infinity)
            Text("本期利息:\t\(item.interest)")
//                .frame(maxWidth: .infinity)
            Text("本期本金:\t\(item.principal)")
//                .frame(maxWidth: .infinity)
        }
    }
}
