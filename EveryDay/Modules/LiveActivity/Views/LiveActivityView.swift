//
//  LiveActivityView.swift
//  EveryDay
//
//  Created by apple on 2024/2/29.
//

import SwiftUI
import ActivityKit

struct LiveActivityView: View {
    
    var activity: Activity<EveryDayWidgetAttributes>? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Button("创建灵动岛") {
                startLiveActivity()
            }
            Button("更新灵动岛") {
                updateLiveActivity()
            }
            Button("销毁灵动岛") {
                destroyLiveActivity()
            }
        }
    }
    
    private func startLiveActivity() {
        Task {
            let attributes = EveryDayWidgetAttributes(name: "灵动岛测试")
            let state = EveryDayWidgetAttributes.ContentState(emoji: "😀")
            let content = ActivityContent<EveryDayWidgetAttributes.ContentState>(state: state, staleDate: nil)
            do {
                let activity = try Activity<EveryDayWidgetAttributes>.request(attributes: attributes, content: content)
                print("Requested a Live Activity \(activity.id)")
                print("已开启灵动岛显示 App 切换到后台即可看到")
            } catch let error {
                print("出错了：\(error.localizedDescription)")
            }
        }
    }
    
    private func updateLiveActivity() {
        Task {
            let state = EveryDayWidgetAttributes.ContentState(emoji: "😂")
            let content = ActivityContent<EveryDayWidgetAttributes.ContentState>(state: state, staleDate: nil)
            for activity in Activity<EveryDayWidgetAttributes>.activities {
                await activity.update(content)
            }
        }
    }
    
    private func destroyLiveActivity() {
        Task {
            for activity in Activity<EveryDayWidgetAttributes>.activities {
                await activity.end(nil, dismissalPolicy: .immediate)
            }
        }
    }
}

struct EveryDayWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

#Preview {
    LiveActivityView()
}
