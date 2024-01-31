//
//  CommemorationDayViewModel.swift
//  EveryDay
//
//  Created by apple on 2024/1/16.
//

import Foundation

class CommemorationDayViewModel {
    
    var commemorationDays: [CommemorationDay] = [
        CommemorationDay(id: 1, type: 1, name: "A生日", date: Date(timeIntervalSince1970: 1074234510)),
        CommemorationDay(id: 2, type: 1, name: "B生日", date: Date(timeIntervalSince1970: 1074235510)),
        CommemorationDay(id: 3, type: 1, name: "C生日", date: Date(timeIntervalSince1970: 1074236510)),
    ]
}
