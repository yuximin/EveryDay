//
//  HabitRow.swift
//  EveryDay
//
//  Created by apple on 2024/1/23.
//

import SwiftUI

struct HabitRow: View {
    
    @State private var title: String
    
    init(title: String) {
        print("HabitRow init", title)
        self.title = title
    }
    
    var body: some View {
        Text(title)
    }
}

#Preview {
    HabitRow(title: "习惯1")
}
