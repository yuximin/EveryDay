//
//  MoreView.swift
//  EveryDay
//
//  Created by apple on 2024/1/30.
//

import SwiftUI

struct MoreView: View {
    
    @State var items: [MoreItem] = [.mortgageCalculator]
    
    var body: some View {
        NavigationStack {
            List(items) { item in
                NavigationLink {
                    item.detailView
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
