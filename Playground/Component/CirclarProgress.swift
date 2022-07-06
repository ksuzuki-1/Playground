//
//  CirclarProgress.swift
//  PlayGround
//
//  Created by ksuzuki on 2022/07/03.
//

import SwiftUI

struct CirclarProgress: View {
    let progress: Int
    let isInserve: Bool
    let strokeWidth: CGFloat
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

    var body: some View {
        Circle()
            .trim(from: from, to: to)
            .stroke(.blue, lineWidth:  strokeWidth)
            .rotationEffect(Angle(degrees: angle))
    }
}

struct CirclarProgress_Previews: PreviewProvider {
    static var previews: some View {
        CirclarProgress(
            progress: 50,
            isInserve: false,
            strokeWidth: 24
        )
    }
}
