//
//  HabitDetailView.swift
//  EveryDay
//
//  Created by apple on 2024/1/17.
//

import SwiftUI

struct HabitDetailView: View {
    
    @EnvironmentObject var pathManager: PathManager
    
    @State private var habit: Habit
    
    @State private var dates: Set<DateComponents> = []
    
    @State private var dakaCount: String = "1d"
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Image("home_tab_item_commemoration_day_sel")
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .overlay(
                        RoundedRectangle(cornerRadius: 40).stroke(.gray, lineWidth: 2)
                    )
                Text("习惯名称")
                    .foregroundStyle(.black)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                Text("习惯Slogan")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            .background(.yellow)
            
            HStack(alignment: .top, spacing: 10) {
                ForEach(0..<3) { index in
                    HabitDetailCountView(content: $dakaCount, description: index == 1 ? "总打卡次数" : "总完成")
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .shadow(radius: 6)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(.yellow)
            
            Text("打卡信息")
                .background(.yellow)
                .font(.system(size: 18, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            
            MultiDatePicker("呵呵", selection: $dates)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 6)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
            
            Text("更多信息")
                .background(.yellow)
                .font(.system(size: 18, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            
            VStack(spacing: 10, content: {
                ForEach(0..<3) { index in
                    NavigationLink {
                        Text("更多信息")
                    } label: {
                        HStack(alignment: .top) {
                            Image(systemName: "tray.and.arrow.up.fill")
                                .frame(alignment: .center)
                                .background(.yellow)
                            Text("选项")
                                .background(.yellow)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.all, 10)
                    }
                    .background(.teal)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding([.leading, .trailing], 20)
                }
            })
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 234.0/255.0, green: 234.0/255.0, blue: 234.0/255.0))
        .toolbar(.hidden, for: .tabBar)
        .toolbar(.visible, for: .navigationBar)
        .navigationTitle("习惯")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("习惯列表") {
                    
                }
            }
        }
    }
}

#Preview {
    HabitDetailView(habit: Habit(id: 0, timeValue: 0, title: "习惯0"))
}
