//
//  WeekDay.swift
//  Accomplish
//
//  Created by Marcello Gonzatto Birkan on 02/03/24.
//

import SwiftUI

/// Fetching Week based on given Date
func fetchWeek(_ date: Date = Date()) -> [WeekDay] {
  let calendar = Calendar.current
  let startOfDate = calendar.startOfDay(for: date)
  
  var week: [WeekDay] = []
  let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
  guard let startOfWeek = weekForDate?.start else {
    return []
  }
  
  /// Iterating to get the Full Week
  (0..<7).forEach { index in
    if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek) {
      week.append(.init(date: weekDay))
    }
  }
  
  return week
}



/// Checking Two dates are the same
func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
  return Calendar.current.isDate(date1, inSameDayAs: date2)
}

struct WeekDay: Identifiable {
  var id = UUID()
  var date = Date.now
}
