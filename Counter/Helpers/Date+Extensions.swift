//
//  Date+Extensions.swift
//  Counter
//
//  Created by Evgeniy Kostyaev on 27.11.2024.
//

import Foundation

extension Date {
    var dateTimeString: String { DateFormatter.defaultDateTime.string(from: self) }
}

private extension DateFormatter {
    static let defaultDateTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY hh:mm:ss"
        return dateFormatter
    }()
}
