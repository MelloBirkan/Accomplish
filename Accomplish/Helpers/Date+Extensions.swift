//
//  Date+Extensions.swift
//  Accomplish
//
//  Created by Marcello Gonzatto Birkan on 02/03/24.
//

import SwiftUI

/// Date Extensions Need for Building UI
extension Date {
  /// Checking Whether the Date is Today
  var isToday: Bool {
    return Calendar.current.isDateInToday(Date())
  }
}
