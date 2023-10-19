//
//  ContentView.swift
//  YouTubePlayerKitTest
//
//  Created by Michel Storms on 19/10/2023.
//

import SwiftUI
import YouTubePlayerKit

struct ContentView: View {
    @StateObject var youTubePlayer: YouTubePlayer = "https://youtube.com/watch?v=psL_5RIBqnY"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
            
            YouTubePlayerView(self.youTubePlayer) { state in
                // Overlay ViewBuilder closure to place an overlay View
                // for the current `YouTubePlayer.State`
                switch state {
                case .idle:
                    ProgressView()
                case .ready:
                    EmptyView()
                case .error(let error):
                    Text(verbatim: "YouTube player couldn't be loaded with error: \(error)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
