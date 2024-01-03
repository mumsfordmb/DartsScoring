//
//  DartGame.swift
//  DartsScoring
//
//  Created by brummel on 19.09.23.
//

import Combine
import SwiftUI
import AudioToolbox
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playCustomSound(soundName: String) {
    guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "m4a") else {
        print("Sound file not found.")
        return
    }

    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        audioPlayer?.play()
    } catch {
        print("Could not load the sound file.")
    }
}


enum GameMode {
    case standard
    case singleOut
}

class DartGame: ObservableObject {
    @Published var showingWinningAlert = false
    @Published var winningMessage = ""
    @Published var players: [Player] = []
    @Published var gameType: GameMode = .standard
    @Published var currentPlayerIndex = 0
    @Published var isGameActive: Bool = true
    @Published var isCurrentTurnConfirmed: Bool = false
    @Published var hasThrownThreeDarts = false
    @Published var hasPlayerBusted = false
    @Published var nextTurnStart = false
    @Published var hasUndoneAll = false

    @Published var savedPlayerNames: [String] = []
    
    // Start: PlayerStats
    var playerStats: [PlayerStats] = [] // transfer Data to PlayerStats
    var gameState = GameState() // transfer Data to GameState
    
    func getSuggestedCheckouts() -> [String] {
        // Make sure the currentPlayerIndex is within the bounds of the players array.
        if currentPlayerIndex >= 0 && currentPlayerIndex < players.count {
            let currentPlayer = players[currentPlayerIndex]
            return suggestCheckout(forScore: currentPlayer.currentScore) ?? []
        }
        return []
    }

    private func suggestCheckout(forScore score: Int) -> [String]? {
        // Assuming gameType is either .standard or .singleOut and you have a list of checkouts for double out
        guard gameType == .standard else { return nil }
        return checkoutDictionary.first(where: { $0.score == score })?.methods
    }
    
    func startNewGame(numberOfPlayers: Int, gameType: GameMode, playerNames: [String]) {
        self.gameType = gameType
        players.removeAll()
        playerStats = Array(repeating: PlayerStats(), count: numberOfPlayers) // Initialize playerStats here

        if !playerNames.isEmpty {
            for name in playerNames {
                players.append(Player(name: name))
            }
        } else {
            for i in 1...numberOfPlayers {
                if i <= savedPlayerNames.count {
                    players.append(Player(name: savedPlayerNames[i-1]))
                } else {
                    players.append(Player(name: "Player \(i)"))
                }
            }
        }
    }

    func inputDartScore(forPlayer player: Player, score: Int, multiplier: Int = 1) {
        objectWillChange.send()
        
        // Only allow score input if less than three darts have been thrown
        guard player.dartsThrown.count < 3 else {
            print("Already thrown 3 darts. Please confirm the turn to continue.") // PopUp Trigger 2
            playCustomSound(soundName: "back_002")
            AudioServicesPlaySystemSound(4095) //Vibration
            return
        }
        
        if player.dartsThrown.isEmpty {
            player.startingScoreForTurn = player.currentScore
            player.lastThreeDarts.removeAll()
        }
        
        let effectiveScore = score * multiplier
        guard isValidScore(effectiveScore) else { return }
        //let startingScore = player.currentScore
        
        player.totalDartsThrown += 1
        //print(player.totalDartsThrown)
        gameState.dartsThrownThisTurn += 1
        //print(gameState.dartsThrownThisTurn)
        gameState.turnStarted = true
        hasUndoneAll = false
        //print(gameState.turnStarted)
        //print(hasUndoneAll)
        player.throwDart(score: effectiveScore, scoreDisplay: "\(multiplier) x \(score)")
        
        if effectiveScore >= 0 {
            player.currentScore -= effectiveScore
            player.dartsThrown.append(effectiveScore)
            player.totalScoreMade += max(effectiveScore, 0)
        }
        
        
        let isLastDart = player.dartsThrown.count % 3 == 0 // Every three darts
        let isBust = (player.currentScore <= 1 && gameType == .standard) || player.currentScore < 0
        
        print("Effective Score: \(effectiveScore), Player Current Score: \(player.currentScore)")
        
        
        if player.currentScore == 0 && (gameType == .singleOut || (gameType == .standard && multiplier == 2)) {
            declareWinner(player: player) // Handle win
        } else if isBust {
            player.currentScore = player.startingScoreForTurn // Handle bust
            player.dartsThrown.removeAll() // Reset thrown darts for the player
            currentPlayerIndex = (currentPlayerIndex + 1) % players.count // Switch to next player
            hasPlayerBusted = true
            playCustomSound(soundName: "question_004")
        } else if isLastDart {
            // Do not automatically switch players, set a flag to require manual confirmation
            isCurrentTurnConfirmed = false
            hasThrownThreeDarts = true
        }
    }

    func confirmAndSwitchPlayer() {
        if !isCurrentTurnConfirmed && hasThrownThreeDarts == true && currentPlayerIndex >= 0 && currentPlayerIndex < players.count {
            // Calculate last turn stats before confirming the turn
            let (lastTurnScore, lastTurnDarts) = calculateLastTurnStats(forPlayer: currentPlayerIndex)
            playerStats[currentPlayerIndex].lastTurnScore = lastTurnScore
            playerStats[currentPlayerIndex].dartsThrownCount = lastTurnDarts
            
            // Confirm the current player's turn
            isCurrentTurnConfirmed = true
            players[currentPlayerIndex].dartsThrown.removeAll()
            gameState.dartsThrownThisTurn = 0
            hasThrownThreeDarts = false

            // Increase the currentPlayerIndex to switch to the next player
            currentPlayerIndex += 1
            playCustomSound(soundName: "switch_002")
            AudioServicesPlaySystemSound(4095) //Vibration
            gameState.turnStarted = false
            if currentPlayerIndex >= players.count {
                // Reset to the first player if we've gone past the last player
                currentPlayerIndex = 0
                playCustomSound(soundName: "switch_007")
                AudioServicesPlaySystemSound(4095) //Vibration
                gameState.turnStarted = false
            }
            
            // Reset the confirmation flag for the next player
            isCurrentTurnConfirmed = false
        } else {
            // Handle the case where it's not time to switch players
            playCustomSound(soundName: "back_002")
            print("It's not yet time to confirm and switch players.")
        }
    }
    
    func onDartThrown(score: Int, isDouble: Bool, isTriple: Bool) {
        let currentPlayer = players[currentPlayerIndex]
        let multiplier = isDouble ? 2 : (isTriple ? 3 : 1)
        inputDartScore(forPlayer: currentPlayer, score: score, multiplier: multiplier)
    }

    private func isWinningScore(player: Player, score: Int) -> Bool {
        switch gameType {
        case .standard:
            return (player.currentScore - score == 0) && (score == 50 || (score <= 40 && score % 2 == 0))
        case .singleOut:
            return player.currentScore - score == 0
        }
    }

    private func isValidScore(_ score: Int) -> Bool {
        let validScores = Set((0...20).map { $0 } + [25, 50])
        return validScores.contains(score) || validScores.contains(score / 2) || validScores.contains(score / 3)
    }

    private func declareWinner(player: Player) {
        print("Winner is \(player.name)")
        playCustomSound(soundName: "confirmation_002")
        let averageScore = Double(player.totalScoreMade) / Double(player.totalDartsThrown) * 3
        let formattedAverageScore = String(format: "%.2f", averageScore)
        winningMessage = "\(player.name) hat das Spiel mit einem Average von \(formattedAverageScore) Punkten und \(player.totalDartsThrown) geworfenen Darts gewonnen."
        showingWinningAlert = true
        isGameActive = false
    }
    
    private func isValidDartScore(_ score: Int) -> Bool {
        return score >= 0 && score <= 180
    }
    
    func addNewPlayer(name: String) {
        let player = Player(name: name)
        players.append(player)
    }

    func removePlayer(_ player: Player) {
        players.removeAll { $0.id == player.id }
    }
    
    func undoLastInput(forPlayer player: Player) {
        // Notify the UI that changes will occur
        objectWillChange.send()
        
        guard !player.dartsThrown.isEmpty else { return }
        
        // Retrieve the last score and remove it from the dartsThrown array
        let lastScore = player.dartsThrown.removeLast()
        // Adjust the player's current score
        player.currentScore += lastScore
        
        // Decrease the total darts thrown
        player.totalDartsThrown -= 1
        gameState.dartsThrownThisTurn -= 1
        print(gameState.dartsThrownThisTurn)
        print(gameState.turnStarted)
        //
        if gameState.turnStarted == true && gameState.dartsThrownThisTurn == 0 {
            hasUndoneAll = false
            print(hasUndoneAll)
        } else {
            hasUndoneAll = false
        }
        hasThrownThreeDarts = false
        //
        playCustomSound(soundName: "minimize_006")
        AudioServicesPlaySystemSound(4095) //Vibration
        
        // Update the total score made
        player.totalScoreMade -= lastScore
        
        // Update the last three darts display
        if !player.lastThreeDarts.isEmpty {
            player.lastThreeDarts.removeLast()
        }
    }
    
    func calculateLastTurnStats(forPlayer playerIndex: Int) -> (lastTurnScore: Int, lastTurnDarts: Int) {
            let player = players[playerIndex]
            let lastTurnScore = player.lastScoreSum // Assuming lastScoreSum is calculated elsewhere
            let lastTurnDarts = player.dartsThrown.count

            return (lastTurnScore, lastTurnDarts)
        }
    
    func switchToPreviousPlayer() {
        if hasPlayerBusted {
            // Calculate & Update the index of the previous player
            let previousPlayerIndex = currentPlayerIndex == 0 ? players.count - 1 : currentPlayerIndex - 1
            currentPlayerIndex = previousPlayerIndex
            
            // Access the previous player's stats
            let previousPlayerStats = playerStats[previousPlayerIndex]
            let previousPlayer = players[previousPlayerIndex]
            
            // Restore last thrown Darts (max of 3) Complete Turn removed.
            previousPlayer.totalDartsThrown -= previousPlayerStats.dartsThrownCount
            previousPlayer.totalScoreMade -= previousPlayerStats.lastTurnScore

            //let previousPlayer = players[previousPlayerIndex]
            hasPlayerBusted = false
            gameState.dartsThrownThisTurn = 0

        } else if hasUndoneAll { // func deaktiviert!
            // Calculate & Update the index of the previous player
            let previousPlayerIndex = currentPlayerIndex == 0 ? players.count - 1 : currentPlayerIndex - 1
            currentPlayerIndex = previousPlayerIndex
        
            // Access the previous player's stats
            let previousPlayerStats = playerStats[previousPlayerIndex]
            let previousPlayer = players[previousPlayerIndex]

            // Apply stored stats to revert the game state
            previousPlayer.currentScore += previousPlayerStats.lastTurnScore
            previousPlayer.totalScoreMade -= previousPlayerStats.lastTurnScore
            previousPlayer.totalDartsThrown -= previousPlayerStats.dartsThrownCount
            gameState.dartsThrownThisTurn = 0
        }

    }
    
}
