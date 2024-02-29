//
//  AppIntent.swift
//  EveryDayWidget
//
//  Created by apple on 2024/2/29.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
    
    @Parameter(title: "Should Display Slogan", default: true)
    var shouldDisplaySlogan: Bool
    
    @Parameter(title: "Slogan", default: "好好学习，天天向上")
    var slogan: String
    
    static var parameterSummary: some ParameterSummary {
        When(\.$shouldDisplaySlogan, .equalTo, true) {
            Summary {
                \.$shouldDisplaySlogan
                \.$slogan
            }
        } otherwise: {
            Summary {
                \.$shouldDisplaySlogan
            }
        }

    }
}
