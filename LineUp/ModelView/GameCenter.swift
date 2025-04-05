//
//  Makerandom.swift
//  CulComL1
//
//  Created by 이승준 on 6/20/24.
//

import Foundation
import Observation

@Observable class GameCenter {
    
    var mode: AppState
    
    var max: Int = 3
    var index: Int
    var current: Int
    
    var cycleArray: [Int]
    var currentArray: [Int]
    
    init(max: Int) {
        self.max = max
        self.mode = .editing
        current = 0
        index = 0
        cycleArray = []
        currentArray = []
    }
    
    func basicRandom() {
        current = Int.random(in: 1...max)
    }
    
    func startPressed() {
        mode = .playing
        cycleArray = Array(1...max).shuffled()
        current = cycleArray[index]
    }
    
    func nextPressed() {
        index += 1
        if index%max == 0 { //Regenerate CycleArray
            mode = .done
            cycleArray = cycleArray.shuffled()
        }
        current = cycleArray[index%max]
    }
    
    func restartPressed() {
        mode = .playing
    }
    
    func returnPressed() {
        mode = .editing
        current = 0
        index = 0
    }
        
    func progress() -> Double{
        lazy var temp = Double((index + 1) % max)
        let result = (temp == 0.0) ? Double(max) : temp
        return result/Double(max)
    }
    
}
