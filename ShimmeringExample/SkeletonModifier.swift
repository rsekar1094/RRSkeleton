//
//  SkeletonModifier.swift
//  ShimmeringExample
//
//  Created by Raj S on 15/04/25.
//

import SwiftUI

/// A view modifier that applies a shimmering skeleton loading effect to any SwiftUI view.
struct SkeletonModifier: ViewModifier {
    
    private static let defaultAnimation: Animation =
        .easeInOut(duration: 1.5).repeatForever(autoreverses: false)
    
    @Environment(\.colorScheme) private var scheme
    @State private var isAnimating = false

    let rotationAngle: Angle
    let isRedacted: Bool
    let animation: Animation

    /// Initializes the SkeletonModifier.
    /// - Parameters:
    ///   - isRedacted: Indicates if the view should show the placeholder effect.
    ///   - animation: The animation used for shimmer movement.
    ///   - rotationAngle: The angle of the shimmer effect.
    init(
        isRedacted: Bool,
        animation: Animation = Self.defaultAnimation,
        rotationAngle: Angle = .degrees(15)
    ) {
        self.isRedacted = isRedacted
        self.animation = animation
        self.rotationAngle = rotationAngle
    }

    func body(content: Content) -> some View {
        content
            .redacted(reason: isRedacted ? .placeholder : [])
            .overlay(
                Group {
                    if isRedacted {
                        GeometryReader { proxy in
                            let size = proxy.size
                            let skeletonWidth = size.width / 2
                            let blurRadius = max(skeletonWidth / 2, 30)
                            let blurDiameter = blurRadius * 2
                            let minX = -(skeletonWidth + blurDiameter)
                            let maxX = size.width + skeletonWidth + blurDiameter

                            Rectangle()
                                .fill(scheme == .dark ? Color.white : Color.black)
                                .frame(width: skeletonWidth, height: size.height * 2)
                                .blur(radius: blurRadius)
                                .rotationEffect(rotationAngle)
                                .offset(x: isAnimating ? maxX : minX)
                        }
                        .blendMode(.softLight)
                        .clipped()
                        .onAppear {
                            withAnimation(animation) {
                                isAnimating = true
                            }
                        }
                        .onDisappear {
                            isAnimating = false
                        }
                    }
                }
            )
    }
}

extension View {
    /// Applies a skeleton shimmering effect to the view.
    /// - Parameter isOn: Indicates if the shimmer effect should be active.
    /// - Returns: A view with or without the shimmer effect.
    func skeleton(isOn: Bool) -> some View {
        modifier(SkeletonModifier(isRedacted: isOn))
    }
}
