//
//  CurrentWeather.swift
//  Weather+MVVM
//
//  Created by jusong on 2023/08/30.
//

import Foundation

struct CurrentWeather: Codable {
    let iconCode: String?
    let timezone: String?
    let temp: Double?
}
