//
//  ImageIntent.swift
//  Weather+MVVM
//
//  Created by jusong on 2023/08/31.
//

import Foundation
import AppIntents
import WidgetKit

struct ImageIntent: AppIntent {
    static var title: LocalizedStringResource = "Image Task State"
    
    func perform() async throws -> some IntentResult {
        print("Image Task State")
        ButtonImageTap.update()
        return .result()
    }
}

class ButtonImageTap {
    static func update() {
        var imageStringBeforeUpdate = UserDefaults.standard.string(forKey: "initialCode")
        var updatedImageString: String = "50n"
        
        var entries = WidgetData.read().map {
            WeatherEntry(widgetData: $0)
        }

        print("imageStringBeforeUpdate: \(imageStringBeforeUpdate)")
        
        if entries[0].widgetData.iconCode != "50n" {
            print("debug 1")
            WidgetData.write(updatedImageString, entries[0].widgetData.timezone, entries[0].widgetData.temp, entries[0].widgetData.updateTime)
        } else {
            print("debug 2")
            WidgetData.write(imageStringBeforeUpdate, entries[0].widgetData.timezone, entries[0].widgetData.temp, entries[0].widgetData.updateTime)
        }
        
        WidgetCenter.shared.reloadAllTimelines()
    }

}
