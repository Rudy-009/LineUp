//
//  DoneView.swift
//  CulComL1
//
//  Created by 이승준 on 6/27/24.
//

import SwiftUI

struct DoneView: View {
    
    var gameCenter: GameCenter
    
    var body: some View {
        Text(String("Done!"))
            .font(.custom("", size: 100))
        Restart(gameCenter: gameCenter)
            .padding(20)
        Return(gameCenter: gameCenter)
            .padding(20)
    }
}

struct Restart: View {
    
    var gameCenter: GameCenter
    
    var body: some View {
        Button {
            gameCenter.restartPressed()
        } label: {
            Text("Restart")
                .font(.custom("", size: 75))
        }
    }
}


#Preview {
    DoneView(gameCenter: GameCenter(max: 5))
}
