//
//  Wave.swift
//  Nofein
//
//  Created by 권민재 on 1/14/24.
//

import SwiftUI

struct Wave: Shape {
    
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let waveHeight = 0.035 * rect.height
        let yoffset = CGFloat(1-percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        path.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 10) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: x, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

struct WaveEffect: View {
    
    @State private var percent = 30.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
//                Rectangle()
//                    .fill(Color.gray.opacity(0.1))
//                    .frame(width: 400,height: 400)
                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: percent / 100.0)
                    .fill(Color.blue)
                    .frame(width: 400,height: 440)
                Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: percent / 100.0)
                    .fill(Color.blue)
                    .opacity(0.5)
                    .frame(width: 400, height: 440)
            }
            .mask {
                Image("cup")
                    .resizable()
                    .frame(width: 400,height: 440)
            }
            Slider(value: $percent, in: 0...100)
        }
        .padding()
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                self.waveOffset2 = Angle(degrees: -180)
            }
        }
    }
}


#Preview {
    WaveEffect()
}
