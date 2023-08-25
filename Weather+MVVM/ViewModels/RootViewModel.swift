//
//  RootViewModel.swift
//  MVVM+Rx
//
//  Created by mobile on 2023/02/09.
//

import Foundation
import RxSwift
import RxCocoa

class RootViewModel {
    let title = "Global Weather"

    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }

    func fetchWeather() -> Observable<OpenWeather> {
        weatherService.fetchWeatherData(lat: 37.54920197, lon: 126.92320251)
    }
}

