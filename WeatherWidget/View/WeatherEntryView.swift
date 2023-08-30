//
//  WeatherEntryView.swift
//  WeatherWidgetExtension
//
//  Created by jusong on 2023/08/25.
//

import WidgetKit
import SwiftUI

struct WeatherEntryView: View {
    var entry: Provider.Entry

    var body: some View {

        HStack {
            Text(entry.widgetData.lblLastestUpdateTime)
                .font(.caption)

            Spacer()
            Button(intent: ToggleStateIntent(id: "test")) {
                Image(systemName: "arrow.clockwise")
            }
        }

        HStack {
            VStack {
                Image(uiImage: UIImage(named: "02d")!)
                Spacer()
                Text(entry.widgetData.lblTimezone)
                    .font(.caption)
                Text(entry.widgetData.lblTemp)
                    .font(.caption2)
            }
            Spacer()
            VStack {
                Image(uiImage: UIImage(named: "02d")!)
                Spacer()
                Text(entry.widgetData.lblTimezone)
                    .font(.caption)
                Text(entry.widgetData.lblTemp)
                    .font(.caption2)
            }
            Spacer()
            VStack {
                Image(uiImage: UIImage(named: "02d")!)
                Spacer()
                Text(entry.widgetData.lblTimezone)
                    .font(.caption)
                Text(entry.widgetData.lblTemp)
                    .font(.caption2)
            }
            Spacer()
            VStack {
                Image(uiImage: UIImage(named: "02d")!)
                Spacer()
                Text(entry.widgetData.lblTimezone)
                    .font(.caption)
                Text(entry.widgetData.lblTemp)
                    .font(.caption2)
            }
        }



    }
}

#Preview(as: .systemMedium) {
    WeatherWidget()
} timeline: {
    WeatherEntry(widgetData: .preview)
}

