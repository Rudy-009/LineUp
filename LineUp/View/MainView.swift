//
//  ContentView.swift
//  CulComL1
//
//  Created by 이승준 on 6/10/24.
//

import SwiftUI

enum AppState {
    case playing, editing, done
}

struct MainView: View {
    
    var gameCenter = GameCenter(max: Int(3))
    
    var body: some View {
        VStack {
            switch gameCenter.mode {
            case .editing :
                EditingView(gameCenter: gameCenter)
            case .playing :
                PlayingView(gameCenter: gameCenter)
            case .done :
                DoneView(gameCenter: gameCenter)
            }
        }
    }
}

#Preview {
    MainView()
}
