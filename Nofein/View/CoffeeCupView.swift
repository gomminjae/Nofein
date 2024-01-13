//
//  CoffeeCupView.swift
//  Nofein
//
//  Created by 권민재 on 1/14/24.
//

import SwiftUI

struct CoffeeCupView: View {
    var body: some View {
        VStack {
            // 컵 상단 부분
            Capsule()
                .frame(width: 150, height: 50)
                .foregroundColor(.brown)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 120, height: 10)
                        .foregroundColor(.brown)
                        .offset(y: -25)
                )
            // 컵 중간 부분
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 150, height: 150)
                .foregroundColor(.brown)
            
            // 컵 밑바닥
            Capsule()
                .frame(width: 150, height: 50)
                .foregroundColor(.brown)
        }
    }
}

#Preview {
    CoffeeCupView()
}
