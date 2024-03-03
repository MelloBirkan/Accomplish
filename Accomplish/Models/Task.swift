//
//  Task.swift
//  Accomplish
//
//  Created by Marcello Gonzatto Birkan on 02/03/24.
//

import SwiftUI

struct Task: Identifiable {
  var id = UUID()
  var taskTitle: String
  var creatingDate = Date()
  var isCompleted: Bool = false
  var tint: Color
}

extension Task {
  static let sampleTasks: [Self] = [
    .init(taskTitle: "Recorded Video", tint: .first),
    .init(taskTitle: "Redesign Website", creatingDate: Date.now, tint: .first),
  ]
}

extension Date {
  static func updateHour(_ value: Int) -> Date {
    let calendar = Calendar.current
    return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
  }
}
