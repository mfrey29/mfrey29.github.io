//
//  SideBinButton.swift
//  GuyTime
//
//  Created by Michael Frey on 6/3/25.
//

import SwiftUI

struct HalfCapsuleRight: Shape {
    func path(in rect: CGRect) -> Path {
        let radius = rect.height / 2
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.midY),
                    radius: radius,
                    startAngle: .degrees(270),
                    endAngle: .degrees(90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct SideBinButton: View {
    var isHovering: Bool = false

    let shapeWidth: CGFloat = 62
    let shapeHeight: CGFloat = 42

    var body: some View {
        ZStack {
            HalfCapsuleRight()
                .fill(Color("SideBinButton"))
                .frame(width: shapeWidth, height: shapeHeight)
                .scaleEffect(x: -1, y: 1) // flip horizontally!
                .shadow(radius: 4)

            Image(systemName: "arrow.up.bin")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("DistanceBanner"))
                .scaleEffect(isHovering ? 1.12 : 1)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isHovering)
        }
        .frame(width: shapeWidth, height: shapeHeight, alignment: .trailing)
        // .padding(.trailing, 0) // REMOVE this
        .padding(.bottom, 42)
//        .shadow(color: .black.opacity(0.08), radius: 3, x: 0, y: 1)
    }
}


struct SideBinButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            SideBinButton(isHovering: true)
        }
        .ignoresSafeArea()
        .previewLayout(.sizeThatFits)
    }
}



