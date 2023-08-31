//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by jusong on 2023/08/25.
//

import WidgetKit
import SwiftUI

struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WeatherEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)

            } else {
                WeatherEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

