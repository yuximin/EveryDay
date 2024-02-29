//
//  EveryDayWidget.swift
//  EveryDayWidget
//
//  Created by apple on 2024/2/29.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), time: .morning, configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), time: .morning, configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
            
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 8..<12:
            entries.append(SimpleEntry(date: Date(), time: .morning, configuration: ConfigurationAppIntent()))
            entries.append(SimpleEntry(date: getDate(in: 12), time: .afternoon, configuration: ConfigurationAppIntent()))
            entries.append(SimpleEntry(date: getDate(in: 18), time: .night, configuration: ConfigurationAppIntent()))

        case 12..<18:
            entries.append(SimpleEntry(date: Date(), time: .afternoon, configuration: ConfigurationAppIntent()))
            entries.append(SimpleEntry(date: getDate(in: 18), time: .night, configuration: ConfigurationAppIntent()))

        default:
            entries.append(SimpleEntry(date: Date(), time: .night, configuration: ConfigurationAppIntent()))
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
    
    func getDate(in hour: Int) -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.hour = hour
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)!
    }
}

struct SimpleEntry: TimelineEntry {
    enum Time {
        case morning, afternoon, night
        
        var text: String {
            switch self {
            case .morning:
                return "早上"
            case .afternoon:
                return "下午"
            case .night:
                return "晚上"
            }
        }
        
        var icon: String {
            switch self {
            case .morning:
                return "sunrise"
            case .afternoon:
                return "sun.max.fill"
            case .night:
                return "sunset"
            }
        }
    }
    
    let date: Date
    let time: Time
    let configuration: ConfigurationAppIntent
}

struct EveryDayWidgetEntryView : View {
    var entry: Provider.Entry
    
    // 环境变量获取当前的小组件类型
    @Environment(\.widgetFamily) var family: WidgetFamily

    var body: some View {
        switch family {
        case .systemSmall, .systemMedium, .systemLarge, .systemExtraLarge:
            VStack(spacing: 10) {
                Image(systemName: entry.time.icon)
                    .imageScale(.large)
                    .fontWeight(.medium)
                    .foregroundStyle(.red)
                HStack {
                    Text("现在是:")
                    Text(entry.time.text)
                }
                .font(.subheadline)
                if entry.configuration.shouldDisplaySlogan {
                    Text(entry.configuration.slogan)
                }
                
                Link(destination: URL(string: "https://www.link1.com")!) {
                    Text("链接1").foregroundStyle(.blue)
                }
            }
            .widgetURL(URL(string: "iosnews://iosNews.com/p1=1&p2=2"))
        case .accessoryCorner, .accessoryCircular, .accessoryRectangular, .accessoryInline:
            Image(systemName: entry.time.icon)
                .imageScale(.large)
                .fontWeight(.medium)
                .foregroundStyle(.red)
        @unknown default:
            Rectangle()
        }
    }
}

struct EveryDayWidget: Widget {
    let kind: String = "EveryDayWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            EveryDayWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .accessoryCircular, .accessoryRectangular, .accessoryInline])
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.slogan = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.slogan = "🤩"
        return intent
    }
}

#Preview(as: .accessoryCircular) {
    EveryDayWidget()
} timeline: {
    SimpleEntry(date: .now, time: .morning, configuration: .smiley)
    SimpleEntry(date: .now, time: .afternoon, configuration: .starEyes)
}
