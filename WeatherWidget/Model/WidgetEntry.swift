//
//  WidgetEntry.swift
//  WeatherWidgetExtension
//
//  Created by jusong on 2023/08/25.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    let widgetData: WidgetData
    
    var date: Date {
        widgetData.date
    }
}
