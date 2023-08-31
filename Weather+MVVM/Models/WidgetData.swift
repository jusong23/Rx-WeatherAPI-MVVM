//
//  WidgetData.swift
//  WeatherWidgetExtension
//
//  Created by jusong on 2023/08/25.
//

import Foundation

struct WidgetData: Codable {
    let iconCode: String
    let timezone: String
    let temp: Double
    let updateTime: String

    let date: Date
}

extension WidgetData {
    static let preview = WidgetData(iconCode: "https://openweathermap.org/img/wn/02d@2x.png", timezone: "Timezone", temp: 25.0, updateTime: "13:00:25", date: .now)

    static let dataURL = FileManager.sharedContainerURL.appendingPathComponent("widgetData.json")


    static func write(_ iconCode: String?, _ timezone: String?, _ temp: Double?, _ updateTime: String?) {
        guard let iconCode = iconCode, let timezone = timezone, let temp = temp, let updateTime = updateTime else { return }

        var list = [WidgetData]()
        let data = WidgetData(iconCode: iconCode, timezone: timezone, temp: temp, updateTime: updateTime, date: .now)

        list.append(data)

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(list)
            try data.write(to: dataURL)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    static func read() -> [WidgetData] {
        var list = [WidgetData]()

        if let data = try? Data(contentsOf: dataURL) {
            do {
                let decoder = JSONDecoder()
                list = try decoder.decode([WidgetData].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }

        return list
    }
}
