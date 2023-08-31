//
//  DateFormatter.swift
//  Weather+MVVM
//
//  Created by jusong on 2023/08/31.
//

import Foundation

public func getNowTime() -> String {
    let now = Date()

    let date = DateFormatter()
    date.locale = Locale(identifier: "ko_kr")
    date.timeZone = TimeZone(abbreviation: "KST") // "2018-03-21 18:07:27"
    date.dateFormat = "HH:mm:ss"

    return date.string(from: now)
}
