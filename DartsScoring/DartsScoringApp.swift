//
//  DartsScoringApp.swift
//  DartsScoring
//
//  Created by brummel on 19.09.23.
//

import SwiftUI

@main
struct DartsScoringApp: App {
    // Create an instance of DartGame
    var game = DartGame()
    
    var body: some Scene {
        WindowGroup {
            // Pass the DartGame instance to ContentView
            ContentView(game: game)
        }
    }
}
