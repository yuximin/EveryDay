//
//  EveryDayWidgetBundle.swift
//  EveryDayWidget
//
//  Created by apple on 2024/2/29.
//

import WidgetKit
import SwiftUI

@main
struct EveryDayWidgetBundle: WidgetBundle {
    var body: some Widget {
        EveryDayWidget()
        EveryDayWidgetLiveActivity()
    }
}
