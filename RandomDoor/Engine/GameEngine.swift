//
//  GameEngine.swift
//  RandomDoor
//
//  Created by Даниил Сивожелезов on 29.12.2024.
//

import Foundation

final class GameEngine {
    var score = 0
    var record: Int = UserDefaults.standard.integer(forKey: "record")
    
    private func generateRandomValue() -> Bool {
        Bool.random()
    }
    
    private func roundWin() {
        score += 1
        if record < score {
            UserDefaults.standard.set(score, forKey: "record")
            record = score
        }
    }
    
    private func endGame() {
        score = 0
    }
    
    func checkAnswer(_ answer: Bool) -> Bool {
        let value = generateRandomValue()
        answer == value ? roundWin() : endGame()
        
        return answer == value
    }
}
