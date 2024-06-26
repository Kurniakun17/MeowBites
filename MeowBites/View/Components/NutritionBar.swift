//
//  NutritionBar.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 24/06/24.
//

import SwiftUI

struct Wave: Shape {
    var progress: CGFloat
    var waveHeight: CGFloat
    var phase: CGFloat

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(progress, phase) }
        set {
            progress = newValue.first
            phase = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height

        // Start at the bottom left corner
        path.move(to: CGPoint(x: 0, y: height))

        // Draw the wave
        for x in stride(from: 0, to: width, by: 1) {
            let relativeX = x / width
            let sine = sin(relativeX * 2 * .pi + phase)
            let y = height * (1 - progress) + sine * waveHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }

        // Finish the path
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()

        return path
    }
}

struct NutritionBar: View {
    var type: String
    @State var isAnimating = true
    let startDate = Date()
    @State private var phase: CGFloat = 0
    @State var percentage: Int

    var body: some View {
        TimelineView(.animation) { timeline in
            let progress = timeline.date.timeIntervalSince(startDate) / 4
            let waveProgress = CGFloat(percentage) / 100

            ZStack {
                if percentage <= 20 || percentage >= 120 {
                    HStack {}
                        .frame(width: 60, height: 60)
                        .background(percentage <= 20 ? .orangeSoft.opacity(0.4) : .redSoft.opacity(0.4))
                        .clipShape(Circle())
                        .scaleEffect(isAnimating ? 1.5 : 0)
                        .onAppear {
                            withAnimation(.spring(duration: 1.5).repeatForever(autoreverses: true)) {
                                isAnimating.toggle()
                            }
                        }
                }

                Circle()
                    .stroke(percentage < 120 ? .orangeSoft : .redSoft, lineWidth: 12)
                    .fill(percentage >= 120 ? .redSoft : .white)
                    .frame(width: 60, height: 60)
                    .onAppear {}

                if percentage < 120 {
                    Wave(progress: waveProgress > 0.99 ? 0.80 : waveProgress, waveHeight: 3, phase: phase)
                        .fill(percentage < 120 ? .orangeSoft.opacity(0.7) : .redSoft.opacity(0.7))
                        .frame(width: 70, height: 60)
                        .clipShape(Circle())
                }

                Image(type)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    phase = 2 * .pi
                }
            }
        }
    }
}

#Preview {
    NutritionBar(type: "calorie", percentage: 30)
}
