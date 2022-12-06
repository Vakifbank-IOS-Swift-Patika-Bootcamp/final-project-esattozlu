//
//  Date + Ext.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import Foundation

extension Date {
    static func convertNowToShortFormat() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: now)
    }
}
