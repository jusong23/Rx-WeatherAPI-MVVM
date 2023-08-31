//
//  AriticleService.swift
//  MVVM+Rx
//
//  Created by mobile on 2023/02/09.
//

import Foundation
import RxSwift
import RxCocoa
import WidgetKit

public class SimpleError: Error {
    public init() { }
}

protocol WeatherServiceProtocol {
    func fetchWeatherData(lat:Double, lon:Double) -> Observable<OpenWeather>
}

class WeatherService: WeatherServiceProtocol {
    func fetchWeatherData(lat:Double, lon:Double) -> Observable<OpenWeather> { // 🔩 model struct name
        return Observable.create { (emitter) in
            let newsUrl = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=hourly&appid=70712209ed38b3c9995cdcdd87bda250&units=metric"

            guard let url = URL(string: newsUrl) else {
                emitter.onError(SimpleError())
                return Disposables.create()
            }

            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error { return }
                guard let httpResponse = response as? HTTPURLResponse else { return }
                guard (200 ... 299).contains(httpResponse.statusCode) else { return }

                // data: 서버가 읽을 수 있는 Binary 데이터
                guard let data = data else { fatalError("Invalid Data") }

                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(OpenWeather.self, from: data)
                                        
                    var iconCode = response.current.weather[0].icon
                    var timezone = response.timezone
                    var temp = response.current.temp!
                    var updateTime = getNowTime()
                    UserDefaults.standard.set(iconCode, forKey: "initialCode")
                    
                    WidgetData.write(iconCode, timezone, temp, updateTime)
                    WidgetCenter.shared.reloadAllTimelines()
                    
                    emitter.onNext(response)
                    emitter.onCompleted()
                } catch {
                    emitter.onError(SimpleError())
                    print(error)
                }
            }
            task.resume()

            return Disposables.create()
        }
    }
}
