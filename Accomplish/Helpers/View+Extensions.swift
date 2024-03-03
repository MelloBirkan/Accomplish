//
//  View+Extensions.swift
//  Accomplish
//
//  Created by Marcello Gonzatto Birkan on 02/03/24.
//

import SwiftUI

/// Custom View Extensions
extension View {
  /// Custom Spacers
  @ViewBuilder
  func hSpacing(_ alignment: Alignment) -> some View {
    self
      .frame(maxWidth: .infinity, alignment: alignment)
  }
  
  @ViewBuilder
  func vSpacing(_ alignment: Alignment) -> some View {
    self
      .frame(maxHeight: .infinity, alignment: alignment)
  }
}
