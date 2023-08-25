//
//  WeatherEntryView.swift
//  WeatherWidgetExtension
//
//  Created by jusong on 2023/08/25.
//

import WidgetKit
import SwiftUI

struct WeatherEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)
        }
    }
}

#Preview(as: .systemMedium) {
    WeatherWidget()
} timeline: {
    WeatherEntry(widgetData: .preview)
}

