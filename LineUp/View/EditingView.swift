//
//  EditingView.swift
//  CulComL1
//
//  Created by 이승준 on 6/27/24.
//

import SwiftUI

struct EditingView: View {
    
    var gameCenter: GameCenter
    
    var body: some View {
        Text(String(gameCenter.max))
            .font(.custom("", size: 100))
        HStack {
            CountButton(operation: .minus, gameCenter: gameCenter)
                .disabled(gameCenter.max < 4)
            CountButton(operation: .plus, gameCenter: gameCenter)
                .disabled(gameCenter.max > 19)
        }
        Start(gameCenter: gameCenter)
    }
}

struct CountButton: View {
    
    enum Operation: String {
        case plus = "plus.square"
        case minus = "minus.square"
    }
    
    var operation: Operation
    var gameCenter: GameCenter
    
    var body: some View {
        Button {
            switch operation {
            case .plus:
                gameCenter.max += 1
            case .minus:
                gameCenter.max -= 1
            }
        } label: {
            Image(systemName: operation.rawValue)
                .resizable()
                .frame(width: 100, height: 100)
        }
        .padding(20)
    }
}

struct Start: View {
    
    var gameCenter: GameCenter
    
    var body: some View {
        Button {
            gameCenter.startPressed()
        } label: {
            Text("Start")
                .font(.custom("", size: 75))
        }
    }
}

#Preview {
    EditingView(gameCenter: GameCenter(max: 3))
}
