//
//  PlayingView.swift
//  CulComL1
//
//  Created by 이승준 on 6/27/24.
//

import SwiftUI

struct PlayingView: View {
    
    var gameCenter: GameCenter
    
    var body: some View {
        Progress(gameCenter: gameCenter)
        Spacer()
        Text(String(gameCenter.current))
            .font(.custom("", size: 100))
        Next(gameCenter: gameCenter)
            .padding(20)
        Return(gameCenter: gameCenter)
            .padding(20)
        Spacer()
    }
}

struct Progress: View {
    
    var gameCenter: GameCenter
    
    var body: some View {
        VStack {
            ProgressView(value: gameCenter.progress())
                .tint(.green)
        }
        .padding(20)
        
    }
    
}

struct Next: View {
    
    var gameCenter: GameCenter
    
    var body: some View {
        Button {
            gameCenter.nextPressed()
        } label: {
            Text("Next")
                .font(.custom("", size: 75))
        }
    }
}

struct Return: View {

    var gameCenter: GameCenter
    
    var body: some View {
        
        Button{
            gameCenter.returnPressed()
        } label: {
            Image(systemName: "return")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.gray)
        }
    }
}


#Preview {
    PlayingView(gameCenter: GameCenter(max: 5))
}
