//
//  CirclarProgress.swift
//  PlayGround
//
//  Created by ksuzuki on 2022/07/03.
//

import SwiftUI

struct CirclarProgress: View {
    let progress: Int
    let color: Color
    let isInserve: Bool
    let strokeWidth: CGFloat
    var lineCap: CGLineCap = .butt
    var angle: Double = -90
    private var from: Double {
        if isInserve {
            return 1 - Double(progress) / 100
        } else {
            return 0.0
        }
    }
    private var to: Double {
        if isInserve {
            return 1
        } else {
            return Double(progress) / 100
        }
    }
    private var offset: CGFloat {
        strokeWidth / 2
    }

    var body: some View {
        Circle()
            .trim(from: from, to: to)
            .stroke(color, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: lineCap))
            .rotationEffect(Angle(degrees: angle))
            .padding(offset)
            .aspectRatio(1, contentMode: .fit)
            .animation(.easeOut, value: progress)
    }
}

struct CirclarProgress_Previews: PreviewProvider {
    static var previews: some View {
        CirclarProgress(
            progress: 50,
            color: .blue,
            isInserve: false,
            strokeWidth: 24,
            lineCap: .round,
            angle: 90
        )
    }
}
