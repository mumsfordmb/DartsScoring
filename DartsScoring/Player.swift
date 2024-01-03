//
//  Player.swift
//  DartsScoring
//
//  Created by brummel on 19.09.23.
//

import Foundation

class Player: ObservableObject, Identifiable {
    let id: UUID = UUID()
    @Published var name: String
    @Published var currentScore: Int
    @Published var lastThreeDarts: [String] = []
    @Published var LastScore: Int = 0
    @Published var lastScoreSum: Int = 0
    @Published var dartsThrown: [Int]
    @Published var totalScoreMade: Int
    @Published var totalDartsThrown: Int
    @Published var startingScoreForTurn: Int = 0
    
    
    init(name: String) {
        self.name = name
        self.currentScore = 501
        self.dartsThrown = []
        self.totalScoreMade = 0
        self.totalDartsThrown = 0
    }
    
    func throwDart(score: Int, scoreDisplay: String) {
        // Update the array of the last three dart scores
        lastThreeDarts.append(scoreDisplay)
        if lastThreeDarts.count > 3 {
            lastThreeDarts.removeFirst()
        }
        
        calculateLastScore()
        
    }
    func calculateLastScore() {
        // Initialize a variable to hold the sum of the scores for the current turn
        var sum = 0
            
        // Loop through each score in lastThreeDarts
        for scoreDisplay in lastThreeDarts {
            print("Processing scoreDisplay: \(scoreDisplay)") // Debug line
            // Split the scoreDisplay string into components separated by "x"
            let components = scoreDisplay.split(separator: "x").map { String($0).trimmingCharacters(in: .whitespaces) }
                    
            // If there are two components, try to parse them as Integers
            if components.count == 2, let multiplier = Int(components[0]), let score = Int(components[1]) {
                _ = multiplier * score
                // Add the product of multiplier and score to the sum
                sum += multiplier * score
            } else {
                print("Error: Unable to parse scoreDisplay components into integers") // Debug line
            }
        }
            
        // Set the calculated sum to lastScore
        lastScoreSum = sum
        }
    

    var averageScore: Double {
        return totalDartsThrown == 0 ? 0 : Double(totalScoreMade) / Double(totalDartsThrown) * (3.0)
    }
}

