//
//  EveryDayWidgetLiveActivity.swift
//  EveryDayWidget
//
//  Created by apple on 2024/2/29.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EveryDayWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct EveryDayWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: EveryDayWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // 展开样式 UI
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                // 紧凑型样式左边 UI
                Text("L")
            } compactTrailing: {
                // 紧凑型样式右边 UI
                Text("T \(context.state.emoji)")
            } minimal: {
                // 最小型样式 UI
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension EveryDayWidgetAttributes {
    fileprivate static var preview: EveryDayWidgetAttributes {
        EveryDayWidgetAttributes(name: "World")
    }
}

extension EveryDayWidgetAttributes.ContentState {
    fileprivate static var smiley: EveryDayWidgetAttributes.ContentState {
        EveryDayWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: EveryDayWidgetAttributes.ContentState {
         EveryDayWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: EveryDayWidgetAttributes.preview) {
   EveryDayWidgetLiveActivity()
} contentStates: {
    EveryDayWidgetAttributes.ContentState.smiley
    EveryDayWidgetAttributes.ContentState.starEyes
}
