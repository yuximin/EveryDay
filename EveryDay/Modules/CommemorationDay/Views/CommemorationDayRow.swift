//
//  CommemorationDayRow.swift
//  EveryDay
//
//  Created by apple on 2024/1/16.
//

import SwiftUI

struct CommemorationDayRow: View {
    
    var commemorationDay: CommemorationDay
    
    var body: some View {
        HStack(spacing: 0, content: {
            Text(commemorationDay.name)
                .frame(minWidth: 30, maxWidth: UIScreen.main.bounds.width)
                .font(.system(size: 28, weight: .bold))
                .background(Color.gray)
            Text("\(commemorationDay.days)")
                .frame(minWidth: 30, maxWidth: UIScreen.main.bounds.width)
                .font(.system(size: 28, weight: .semibold))
                .background(Color.blue)
            Text("天")
                .frame(minWidth: 30, maxWidth: UIScreen.main.bounds.width)
                .font(.system(size: 28, weight: .bold))
                .background(Color.yellow)
        })
    }
}

#Preview {
    CommemorationDayRow(commemorationDay: CommemorationDay(id: 1, type: 1, name: "生日", date: Date(timeIntervalSince1970: 1074234510)))
}
