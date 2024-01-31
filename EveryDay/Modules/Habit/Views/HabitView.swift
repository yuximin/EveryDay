//
//  HabitView.swift
//  EveryDay
//
//  Created by apple on 2024/1/17.
//

import SwiftUI

class PathManager: ObservableObject {
    @Published var path: [Int] = []
}

struct HabitView: View {
    
    private let habitTimes: [HabitTime] = HabitTime.allCases
    
    @StateObject var pathManager = PathManager()
    
    @State private var habitList: [Habit] = {
        var habits: [Habit] = []
        for i in 0..<50 {
            let habit = Habit(id: i, timeValue: i % HabitTime.allCases.count, title: "习惯\(i)")
            habits.append(habit)
        }
        return habits
    }()
    
    var body: some View {
        NavigationStack(path: $pathManager.path) {
            List {
                ForEach(habitTimes) { habitTime in
                    Section(habitTime.title) {
                        let habits = self.getHabitList(for: habitTime)
                        ForEach(habits) { habit in
                            NavigationLink {
                                HabitDetailView(habit: habit)
                            } label: {
                                HabitRow(title: habit.title)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button("删除") {
                                            print("删除")
                                        }
                                        .background(.red)
                                    }
                            }
                        }
                    }
                }
            }
            .background(.white)
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .listSectionSeparator(.visible, edges: .bottom)
            .listRowSeparator(.visible, edges: .bottom)
            .environmentObject(pathManager)
        }
    }
    
    private func getHabitList(for time: HabitTime) -> [Habit] {
        var results: [Habit] = []
        for habitItem in habitList {
            if habitItem.time == time {
                results.append(habitItem)
            }
        }
        return results
    }
}

#Preview {
    HabitView()
}
