//
//  CommemorationDayView.swift
//  EveryDay
//
//  Created by apple on 2024/1/16.
//

import SwiftUI

struct CommemorationDayView: View {
    let viewModel = CommemorationDayViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(self.viewModel.commemorationDays, id: \.id) { commemorationDay in
                NavigationLink {
                    CommemorationDayDetailView()
                } label: {
                    CommemorationDayRow(commemorationDay: commemorationDay)
                }
            }
        } detail: {
            Text("选中可查看详情")
        }
    }
}

#Preview {
    CommemorationDayView()
}
