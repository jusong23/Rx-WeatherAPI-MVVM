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
        ZStack {
            VStack {
                HStack(alignment: .center) {
                    Text("EGLOO")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
//                        .foregroundColor(Color.blue)
                    Text("\(entry.widgetData.updateTime)")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                    Spacer()
                    Button(intent: RefereshIntent()) {
                        Image(systemName: "arrow.clockwise")
                    }
                        .buttonStyle(.plain)
                    if (entry.widgetData.iconCode == "dd") {
                    }
                    else {
                    }
                }
                HStack {
                    VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Spacer()
                        Button(intent: ImageIntent()) {
                            Image(uiImage: (UIImage(named: entry.widgetData.iconCode) ?? UIImage(systemName: "plus.circle"))!)
                                .aspectRatio(contentMode: .fill)
                        }
                            .buttonStyle(.plain)
                        Spacer()
                        Text(entry.widgetData.timezone)
                            .font(.caption)
                        Text(String(format: "%.1f", (entry.widgetData.temp)) + "℃")
                            .font(.caption2)
                    }
                    Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Image(uiImage: UIImage(systemName: "plus.circle")!)
                            .widgetURL(URL(string: "addWiget"))
                            .aspectRatio(contentMode: .fill)
                        Spacer()
                        Text(entry.widgetData.timezone)
                            .font(.caption)
                        Text(String(format: "%.1f", (entry.widgetData.temp)) + "℃")
                            .font(.caption2)
                    }
                    Spacer()
                    VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Spacer()
                        Image(uiImage: UIImage(systemName: "plus.circle")!)
                            .widgetURL(URL(string: "addWiget"))
                            .aspectRatio(contentMode: .fill)
                        Spacer()
                        Text(entry.widgetData.timezone)
                            .font(.caption)
                        Text(String(format: "%.1f", (entry.widgetData.temp)) + "℃")
                            .font(.caption2)
                    }
                    Spacer()
                    VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Spacer()
                        Image(uiImage: UIImage(systemName: "plus.circle")!)
                            .widgetURL(URL(string: "addWiget"))
                            .aspectRatio(contentMode: .fill)
                        Spacer()
                        Text(entry.widgetData.timezone)
                            .font(.caption)
                        Text(String(format: "%.1f", (entry.widgetData.temp)) + "℃")
                            .font(.caption2)
                    }
                }
//                Spacer()
//                VStack(alignment: .leading) {
//                    HStack(alignment: .bottom) {
//                        Spacer()
//                        Text("최근 업데이트: \(entry.widgetData.updateTime)")
//                            .font(.caption)
//                            .foregroundColor(Color.gray)
//                    }
//                }
            }
        }
    }
}

#Preview(as: .systemMedium) {
    WeatherWidget()
} timeline: {
    WeatherEntry(widgetData: .preview)
}

