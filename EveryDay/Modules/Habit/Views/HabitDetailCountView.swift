//
//  HabitDetailCountView.swift
//  EveryDay
//
//  Created by apple on 2024/1/26.
//

import SwiftUI

struct HabitDetailCountView: View {
    @Binding var content: String
    var description: String
    
    var body: some View {
        VStack(spacing: 10, content: {
            Text(content)
                .foregroundStyle(.black)
                .font(.system(size: 16))
                .fontWeight(.bold)
            Text(description)
                .foregroundStyle(.gray)
                .font(.system(size: 16))
        })
    }
}
