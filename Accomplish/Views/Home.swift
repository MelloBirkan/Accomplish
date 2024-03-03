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
      .onAppear(perform: {
        if weekSlider.isEmpty {
          let currentWeek = fetchWeek()
          weekSlider.append(currentWeek)
        }
      })
  }
  
  @ViewBuilder
  func HeaderView() -> some View {
    HStack {
      VStack(alignment: .leading, spacing: 6) {
        HStack(spacing: 5) {
          Text(currentDate.formatted(.dateTime.month()))
            .foregroundStyle(.first)
          
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
        TabView(selection: $currentWeekIndex) {
          ForEach(weekSlider.indices, id: \.self) {index in
            let week = weekSlider[index]
            WeekView(week)
              .tag(index)
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 90)
        
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
      .background(.ultraThinMaterial)
    }
  }
  
  @ViewBuilder
  func WeekView(_ week: [WeekDay]) -> some View {
    HStack(spacing: 0) {
      ForEach(week) { day in
        VStack(spacing: 8) {
          Text(day.date.formatted(.dateTime.weekday()))
            .font(.callout)
            .fontWeight(.medium)
            .textScale(.secondary)
            .foregroundStyle(.secondary)
          
          Text(day.date.formatted(.dateTime.day()))
            .font(.callout)
            .fontWeight(.bold)
            .textScale(.secondary)
            .foregroundStyle(isSameDate(day.date, currentDate) ? .accent : .primary)
            .frame(width: 35, height: 35)
            .background(content: {
              if isSameDate(day.date, currentDate) {
                Circle()
                  .fill(.first)
              }
              
              /// Indicator to Show, which is Today's Date
              if day.date.isToday {
                Circle()
                  .fill(.accent)
                  .frame(width: 5, height: 5)
                  .vSpacing(.bottom)
                  .offset(y: 12)
              }
            })
            .background(.BG.shadow(.drop(radius: 1)), in: .circle)
        }
        .hSpacing(.center)
      }
    }
  }
}

#Preview {
  Home()
}
