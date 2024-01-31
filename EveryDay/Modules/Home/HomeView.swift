//
//  HomeView.swift
//  EveryDay
//
//  Created by apple on 2024/1/15.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTabIndex: Int = 3
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            CommemorationDayView()
                .tabItem {
                    Label("纪念日", image: selectedTabIndex == 0 ? "home_tab_item_commemoration_day_sel" : "home_tab_item_commemoration_day_nor")
                }
                .tag(0)
            ToDoListView()
                .tabItem {
                    Label("待办", systemImage: "tray.and.arrow.up.fill")
                }
                .tag(1)
            HabitView()
                .tabItem {
                    Label("习惯", systemImage: "tray.and.arrow.up.fill")
                }
                .tag(2)
            MoreView()
                .tabItem {
                    Label("更多", systemImage: "tray.and.arrow.up.fill")
                }
                .tag(3)
        }
    }
}

#Preview {
    HomeView()
}
