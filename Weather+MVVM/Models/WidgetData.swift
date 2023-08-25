//
//  WidgetData.swift
//  WeatherWidgetExtension
//
//  Created by jusong on 2023/08/25.
//

import Foundation

struct WidgetData: Codable {
    let iconImage: String
    let lblTimezone: String
    let lblTemp: String
    let lblLastestUpdateTime: String
    let date: Date
}

extension WidgetData {
    static let preview = WidgetData(iconImage: "https://openweathermap.org/img/wn/02d@2x.png", lblTimezone: "Sample Timezone", lblTemp: "Sample Temp", lblLastestUpdateTime: "Sample Update Time", date: .now)
}
