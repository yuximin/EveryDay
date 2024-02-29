//
//  EveryDayApp.swift
//  EveryDay
//
//  Created by apple on 2024/1/15.
//

import SwiftUI

@main
struct EveryDayApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .onOpenURL { url in
                    print("onOpenURL:", url.absoluteString)
                }
        }
    }
}
