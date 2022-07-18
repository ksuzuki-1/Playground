//
//  ContentView.swift
//  Playground
//
//  Created by ksuzuki on 2022/07/06.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Int = 0
    @State private var isStarted = false
    @State private var timer: Timer?
    @State private var buttonText = "Start"

    var body: some View {
        VStack {
            CirclarProgress(
                progress: progress,
                color: .blue,
                isInserve: false,
                strokeWidth: 24,
                lineCap: .round
            )
                .background(circularBackground())
            Text(String(progress))
            Button(buttonText, action: {
                if isStarted {
                    isStarted.toggle()
                    buttonText = "Start"
                    progress = 0
                    timer?.invalidate()
                    timer = nil
                    return
                }
                isStarted.toggle()
                buttonText = "Stop"
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    if progress == 100 {
                        progress = 0
                    } else {
                        progress += 10
                    }
                }
            })
        }
    }

    @ViewBuilder private func circularBackground() -> some View {
        Circle()
            .stroke(lineWidth: 24)
            .fill(.blue)
            .opacity(0.5)
            .padding(12)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
