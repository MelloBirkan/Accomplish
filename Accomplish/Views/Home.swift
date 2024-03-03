//
//  Home.swift
//  Accomplish
//
//  Created by Marcello Gonzatto Birkan on 02/03/24.
//

import SwiftUI

struct Home: View {
  /// Task Manager Properties
  @State private var currentDate: Date = .now
  @State private var weekSlider: [[WeekDay]] = []
  @State private var currentWeekIndex: Int = 0
  var body: some View {
    VStack(alignment: .leading, spacing:0) {
      /// Header View
      HeaderView()
    }
    Spacer()
  }
  
  @ViewBuilder
  func HeaderView() -> some View {
    HStack {
      VStack(alignment: .leading, spacing: 6) {
        HStack(spacing: 5) {
          Text(currentDate.formatted(.dateTime.month()))
            .foregroundStyle(.second)
          
          Text(currentDate.formatted(.dateTime.year()))
            .foregroundStyle(.secondary)
        }
        .font(.title)
        .bold()
        
        Text(currentDate.formatted(date: .complete, time: .omitted))
          .font(.callout)
          .fontWeight(.semibold)
          .textScale(.secondary)
          .foregroundStyle(.secondary)
        
        /// Week Slider
        
      }
      .hSpacing(.leading)
      .overlay(alignment: .topTrailing, content: {
        Button(action: {}, label: {
          Image(.profilePhoto)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 65)
            .clipShape(Circle())
        })

      })
      .padding(15)
      .background(.white)
    }
  }
}

#Preview {
  Home()
}
