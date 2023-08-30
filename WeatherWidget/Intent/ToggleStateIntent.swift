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

struct ToggleStateIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle Task State"

    @Parameter(title: "Task ID")
    var id: String

    init() {

    }

    init(id: String) {
        self.id = id
    }

    func perform() async throws -> some IntentResult {
        // async 써서 네트워킹
        print(#function)
        return .result()

    }
}
