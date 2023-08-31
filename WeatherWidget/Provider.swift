//
//  Provider.swift
//  WeatherWidgetExtension
//
//  Created by jusong on 2023/08/25.
//

import Foundation
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(widgetData: .preview)
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        var data = WidgetData.preview
        
        if !context.isPreview {
            let list = WidgetData.read()
            if !list.isEmpty {
                data = list[0]
            }
        } // 실제 데이터 리턴
        
        let entry = WeatherEntry(widgetData: .preview)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        let entries = WidgetData.read().map {
            WeatherEntry(widgetData: $0)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
