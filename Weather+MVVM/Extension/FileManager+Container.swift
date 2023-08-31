//
//  FileManager+Container.swift
//  Weather+MVVM
//
//  Created by jusong on 2023/08/30.
//

import Foundation

extension FileManager {
    static var sharedContainerURL: URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.kr.co.truen.EGLOO.GangNamRoad-MVVM.WeatherWidget.content")!
    }
}
