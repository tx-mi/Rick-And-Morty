//
//  Date+Ext.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 09.01.2023.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
