//
//  ContentView.swift
//  Playground
//
//  Created by ksuzuki on 2022/07/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CirclarProgress(progress: 67, isInserve: false, strokeWidth: 24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
