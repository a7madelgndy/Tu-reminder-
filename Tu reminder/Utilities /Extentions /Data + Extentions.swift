//
//  Data + Extention.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 09/01/2025.
//

import Foundation

extension Date {
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    var isTomorrow : Bool {
        let calendar  = Calendar.current
        return calendar.isDateInTomorrow(self)
    }
    
    var dateComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month , .day, .hour, .minute], from: self)
    }
    
}
