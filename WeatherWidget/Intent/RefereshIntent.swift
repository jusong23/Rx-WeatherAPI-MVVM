//
//  ToggleStateIntent.swift
//  Weather+MVVM
//
//  Created by jusong on 2023/08/30.
//

import Foundation
import AppIntents
import RxSwift
import RxCocoa
import WidgetKit

struct RefereshIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle Task State"
    
    func perform() async throws -> some IntentResult {
        print("RefereshIntent")
        try await IntentWeatherService.apiCall()
        return .result()
    }
}

class IntentWeatherService {
    static func apiCall() async throws {
        let urlStr = "https://api.openweathermap.org/data/2.5/onecall?lat=37.54920197&lon=126.92320251&exclude=hourly&appid=70712209ed38b3c9995cdcdd87bda250&units=metric"

                guard let url = URL(string: urlStr) else {
                    fatalError("Invaild URL")
                }
                
                let session = URLSession.shared
                let task = session.dataTask(with: url) { data, response, error in

                    if let error = error {
                        print(error)
                        return
                    }

                    guard let httpResponse = response as? HTTPURLResponse else {
                        return
                    }
                    guard (200 ... 299).contains(httpResponse.statusCode) else {
                        return
                    }

                    guard let data = data else {
                        fatalError("Invalid Data")
                    }

                    do {
                        let decoder = JSONDecoder()
                        let openWeather = try decoder.decode(OpenWeather.self, from: data)

                        var iconCode = openWeather.current.weather[0].icon
                        var timezone = openWeather.timezone
                        var temp = openWeather.current.temp!
                        var updateTime = getNowTime()
                        UserDefaults.standard.set(iconCode, forKey: "initialCode")
                        
                        print("apiCall")
                        WidgetData.write(iconCode, timezone, temp, updateTime)
                        WidgetCenter.shared.reloadAllTimelines()
                        
                    } catch {
                        print("apiCall error")
                        print(error.localizedDescription)
                    }
                }
                task.resume() 
    }
}
