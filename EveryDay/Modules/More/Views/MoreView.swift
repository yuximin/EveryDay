//
//  MoreView.swift
//  EveryDay
//
//  Created by apple on 2024/1/30.
//

import SwiftUI

struct MoreView: View {
    
    @State var items: [MoreItem] = [.mortgageCalculator, .liveActivity]
    
    var body: some View {
        NavigationStack {
            List(items) { item in
                NavigationLink {
                    switch item {
                    case .mortgageCalculator:
                        MortgageCalculatorView()
                    case .liveActivity:
                        LiveActivityView()
                    }
                } label: {
                    Text(item.title)
                }
            }
        }
    }
}

#Preview {
    MoreView()
}
