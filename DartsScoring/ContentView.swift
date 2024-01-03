//
//  ContentView.swift
//  DartsScoring
//
//  Created by brummel on 19.09.23.
//

import SwiftUI
import AudioToolbox

struct ContentView: View {
    @ObservedObject var game: DartGame
    @State private var showingSetup = true  // This will show the setup view by default when the app starts
    @State private var inputMode: InputMode = .single
    @State private var isShowingConfirmationAlert = false // Declare the state variable
    @State private var showingWinningAlert = false
    @State private var winningMessage = ""
    @State private var showingConfirmTurnPopup = false
    @State private var showingDetails = false
    
    var gameState = GameState()
    
    enum InputMode {
        case single
        case double
        case triple
        
        var multiplier: Int {
            switch self {
            case .single: return 1
            case .double: return 2
            case .triple: return 3
            }
        }
    }
    
    var currentPlayer: Player? {
        guard !game.players.isEmpty else { return nil }
        return game.players[game.currentPlayerIndex]
    }
    
    var orderedPlayers: [Player] {
        var players = game.players
        if game.currentPlayerIndex < players.count {
            players = Array(players[game.currentPlayerIndex..<players.count] + players[0..<game.currentPlayerIndex])
        }
        return players
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isShowingConfirmationAlert = true
                }) {
                    Image(systemName: "multiply.circle")
                        .font(.system(size: 23))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.primary, Color.blue)
                        .padding()
                }
                    
                Spacer()
                    
                Text(game.gameType == .standard ? "Standard Game" : "Single Out Game")
                    .font(.headline)
                    .padding(.trailing)
                    
                Spacer()
                
                if game.hasPlayerBusted || game.hasUndoneAll {
                    Button(action: {
                        game.switchToPreviousPlayer()
                    }) {
                        Group {
                            if game.hasPlayerBusted {
                                Image(systemName: "arrow.uturn.backward.circle")
                                    .font(.system(size: 23))
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.primary, Color.red)
                                    .padding()
                            } else {
                                Image(systemName: "arrow.uturn.backward.circle")
                                    .font(.system(size: 23))
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.primary, Color.green)
                                    .padding()
                            }
                        }
                    }
                }
                //Spacer()
            }
            
            if #available(iOS 17.0, *) {
                if let currentPlayer = currentPlayer {
                    VStack {
                        HStack {
                            Image(systemName: "person.fill.viewfinder")
                                .font(.system(size: 28))
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.primary, Color.blue)
                                .symbolEffect(.bounce.up.byLayer, value: currentPlayer.name)
                            Text(currentPlayer.name)
                                .font(.system(size: 28, weight: .bold, design: .default))
                                .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.9)) //iOS blue
                            //.foregroundColor(Color(red: 0.2, green: 0.7, blue: 0.3)) //iOS green
                                .lineLimit(1) // Truncate long names
                            Spacer() // Pushes everything inside this HStack to the left
                        }
                        HStack {
                            Text("\(currentPlayer.currentScore)")
                                .font(.system(size: 22, weight: .bold, design: .default))
                            Spacer()
                            Text("Ø \(currentPlayer.averageScore, specifier: "%.2f")")
                                .font(.system(size: 22, weight: .bold, design: .default))
                            Spacer()
                            Text("#\(currentPlayer.totalDartsThrown)")
                                .font(.system(size: 22, weight: .bold, design: .default))
                        }
                        Divider()
                        let currentScoreDetail = scoreDetails[currentPlayer.currentScore]
                        if currentScoreDetail != nil {
                            HStack {
                                Text("Click for more checkout details!")
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 23))
                                    .symbolEffect(.bounce.up.byLayer, value: currentPlayer.currentScore)
                                Spacer()
                                Button(action: {
                                    self.showingDetails = true
                                }) {
                                    Image(systemName: "info.circle")
                                        .font(.system(size: 23)) // Adjusts the size of the image
                                        .foregroundStyle(Color.primary, Color.blue)
                                        .symbolEffect(.bounce.up.byLayer, value: currentPlayer.currentScore)
                                }
                                .sheet(isPresented: $showingDetails) { // View of Score Details!
                                    ScoreDetailView(score: currentPlayer.currentScore, scoreDetails: scoreDetails)
                                        .presentationDetents([.fraction(0.23), .medium, .large])
                                }
                                Spacer()
                            }
                            Divider()
                        }}
                    .padding(.horizontal)
                }
            } else {
                // Fallback on earlier versions
            }
            
            List(orderedPlayers) { player in
                VStack(alignment: .leading) {
                    HStack {
                        Text(player.name)
                            .font(.headline)
                            .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.9)) //iOS blue
                            //.foregroundColor(Color(red: 0.2, green: 0.7, blue: 0.3)) //iOS green
                            //.underline()
                        Spacer()
                        Text("Score: \(player.currentScore)")
                            .font(.headline)
                        Spacer()
                        Text("Average: Ø \(player.averageScore, specifier: "%.2f")")
                            .font(.headline)
                    }
                    Divider()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    //Text("Total Darts Thrown: \(player.totalDartsThrown)")
                    Text("Last Score: \(player.lastScoreSum)")
                    Text("Last Throws: \(player.lastThreeDarts.joined(separator: " | "))")
                    // Find all checkout options for the current score
                    let checkoutOptions = checkoutDictionary.filter { $0.score == player.currentScore }
                    let checkoutMethods = checkoutOptions.flatMap { $0.methods }
                    
                    // Join all the methods into a string to display
                    if !checkoutMethods.isEmpty {
                        Text("Mögliche Checkouts:")
                            .font(.headline)
                        Text("\(checkoutMethods.joined(separator: "\n"))")
                            .fixedSize(horizontal: false, vertical: true) // This allows the text to wrap correctly
                            //.fontWeight(.bold)
                            .font(.system(size: 17, weight: .bold, design: .default))
                            .foregroundColor(Color(red: 0.25, green: 0.88, blue: 0.82)) //iOS turquoise
                    } else {
                        // Handle the case where there are no checkout options
                        //Text("No checkout possible")
                            //.font(.headline)
                            //.padding()
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .onReceive(player.objectWillChange, perform: { _ in
                    // This forces the view to update when the player object changes.
                    // It's often not necessary if you use @Published, but can help if updates are not being reflected.
                })
            }
            Spacer()
            
            .alert(isPresented: $isShowingConfirmationAlert) {
                Alert(
                    title: Text("Zurück zum Setup?"),
                    message: Text("Bist du sicher, dass du zum Setup zurückkehren möchtest? Der aktuelle Spielfortschritt geht dabei verloren."),
                    primaryButton: .default(Text("Ja")) {
                        self.showingSetup = true
                    },
                    secondaryButton: .cancel(Text("Abbrechen")) {
                    }
                )
            }
        }
                
        VStack {
            ForEach(0..<4) { column in
                HStack {
                    ForEach(1..<6) { row in
                        let dartNumber = column * 5 + row
                        Button(action: {
                            if let currentPlayer = currentPlayer {
                                let score = dartNumber
                                let multiplier = inputMode.multiplier
                                game.inputDartScore(forPlayer: currentPlayer, score: score, multiplier: multiplier)
                                inputMode = .single
                            }
                        }) {
                            Text("\(dartNumber)")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundColor(Color.primary)
                                .frame(maxWidth: .infinity, minHeight: 0)
                                .padding(5)
                                .background(Color(UIColor.secondarySystemBackground))
                                .foregroundColor(Color.primary)
                                .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
                                .cornerRadius(5)
                                .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                                        ) // Add a border for more definition
                        }
                        //.buttonStyle(PlainButtonStyle()) // Use plain button style
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16) // Abstand zwischen Bildschirmrand & Buttons
            
            HStack {
                InputModeButton(image: Image(systemName: inputMode != .double ? "d.circle" : "d.circle.fill"), selectedMode: $inputMode, mode: .double)
                InputModeButton(image: Image(systemName: inputMode != .triple ? "t.circle" : "t.circle.fill"), selectedMode: $inputMode, mode: .triple)
                        
                Button(action: {
                    if let currentPlayer = currentPlayer {
                        game.inputDartScore(forPlayer: currentPlayer, score: 0)
                        inputMode = .single
                    }
                }) {
                    //Text("0")
                    Image(systemName: "0.circle") // System name for undo icon
                        .font(.system(size: 36))
                        .frame(minWidth: 30, minHeight: 20)
                        .padding(5)
                        .background(Color(UIColor.secondarySystemBackground)) // Dynamic background color
                        .foregroundColor(Color.primary) // Dynamic text/icon color
                        .cornerRadius(5) // Slightly rounded corners like iOS keyboard keys
                        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1) // Subtle shadow for depth
                        .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                                ) // Add a border for more definition
                }
                //.buttonStyle(PlainButtonStyle()) // Use plain button style
                        
                Button(action: {
                    if let currentPlayer = currentPlayer, inputMode != .triple {
                        let score = 25
                        let multiplier = inputMode.multiplier
                        _ = "\(inputMode == .single ? "" : "B")\(25)"
                        game.inputDartScore(forPlayer: currentPlayer, score: score, multiplier: multiplier)
                        inputMode = .single
                    }
                }) {
                    Image(systemName: inputMode != .triple ? "25.circle" : "25.circle.fill")
                        .font(.system(size: 36))
                        .frame(minWidth: 30, minHeight: 20)
                        .padding(5) //Abstand innerhalb des Buttons
                        .background(
                            Group {
                                if inputMode == .triple {
                                    Color.red
                                    //.opacity(inputMode == .triple ? 0.15 : 0)
                                } else {
                                    Color(UIColor.secondarySystemBackground)
                                }
                            }
                        )
                        .foregroundColor(Color.primary)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                                ) // Add a border for more definition
                }
                HStack {
                    Button(action: {
                        if let currentPlayer = currentPlayer {
                            // Call the undo function from your game model
                            game.undoLastInput(forPlayer: currentPlayer)
                        }
                    }) {
                        Image(systemName: "arrow.uturn.backward.circle") // System name for undo icon
                            .font(.system(size: 36))
                            .frame(minWidth: 30, minHeight: 20)
                            .padding(5)
                            .background(Color(UIColor.secondarySystemBackground))
                            .foregroundStyle(Color.primary, Color.blue)
                            .cornerRadius(5)
                            .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                                    ) // Add a border for more definition
                    }}
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16) // Abstand zwischen Bildschirmrand & Buttons
            //.padding() (Abstand zwischen Numpad & Action buttons
            
            Button(action: {
                game.confirmAndSwitchPlayer()
            }) {
                Text(game.hasThrownThreeDarts ? "Next Player" : "Turn not finished yet")
                    .fontWeight(.semibold) // Make the text bold
                    .foregroundColor(game.hasThrownThreeDarts ? Color.white : Color.gray) // Set text color to white
                    .padding() // Add some padding inside the button
                    //.frame(minWidth: 0, maxWidth: .infinity) // Make the button expand to the full width of its container
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.trailing, 10)
                    .background(game.hasThrownThreeDarts ? Color.blue : Color(UIColor.secondarySystemBackground)) // Set the background color to blue
                    .cornerRadius(10) // Rounded corners for the button
                    .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
                    .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                            ) // Add a border for more definition
            }
            //.buttonStyle(PlainButtonStyle()) // Apply the plain button style to remove any default button styling
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16) // Abstand zwischen Bildschirmrand & Buttons
        }
        Spacer()
        
        .alert(isPresented: $game.showingWinningAlert) {
            Alert(
                title: Text("Congratulations!"),
                message: Text(game.winningMessage),
                primaryButton: .default(Text("Neues Spiel starten")) {
                    game.startNewGame(numberOfPlayers: game.players.count,
                                      gameType: game.gameType,
                                      playerNames: game.players.map { $0.name })
                },
                secondaryButton: .default(Text("Zurück zum Setup")) {
                    showingSetup = true
                })
        }


    .sheet(isPresented: $showingSetup) {
        GameSetupView(isPresented: $showingSetup, game: game)
            //.presentationDetents([.fraction(0.75), .large])
            .interactiveDismissDisabled()
    }
    .onAppear {
        game.startNewGame(numberOfPlayers: 1, gameType: .standard, playerNames: [])
    }
}
    
struct InputModeButton: View {
    var image: Image
    @Binding var selectedMode: InputMode
    var mode: InputMode
        
    var body: some View {
        Button(action: {
            selectedMode = selectedMode == mode ? .single : mode
        }) {
            image
                .font(.system(size: 36))
                .frame(maxWidth: .infinity, minHeight: 20)
                .padding(5)
                .background(
                    selectedMode == mode ?
                    Color(UIColor.systemBlue) : // Use system blue color
                    Color(UIColor.secondarySystemBackground) // Use system gray color
                )
                .foregroundColor(Color.primary) // Dynamic foreground color
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
                .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                        )
            }
        }
    }
}

@available(iOS 17.0, *)
struct ScoreDetailView: View {
    @State private var showingDetails = false
    let score: Int
    let scoreDetails: [Int: ScoreDetail]

    var body: some View
        {
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                        .font(.system(size: 35))
                        .foregroundStyle(Color.primary, Color.blue)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.blue, Color.secondary)
                        //.symbolEffect(.bounce, value: showingDetails[true])
                    Text("Showing detailed Information for \(score).")
                        .font(.system(size: 17, weight: .bold, design: .default))
                }
                Divider()
            }
            .padding(10)
            VStack {
                HStack {
                    if let detail = scoreDetails[score] {
                        Image(systemName: "01.circle")
                            .font(.system(size: 23))
                            .foregroundStyle(Color.primary, Color.blue)
                        Text(detail.description)
                        Spacer()
                    } else {
                        Image(systemName: "exclamationmark.circle")
                            .font(.system(size: 23))
                            .foregroundStyle(Color.primary, Color.blue)
                        Text("Keine Zusatzinformationen für \(score) Rest verfügbar.")
                        Spacer()
                    }
                }
            }
            .padding(10)
            //Spacer()
            VStack {
                HStack {
                    if let detail = scoreDetails2[score] {
                        Image(systemName: "02.circle")
                            .font(.system(size: 23))
                            .foregroundStyle(Color.primary, Color.blue)
                        Text(detail.description)
                        Spacer()
                    } else {
                        // Text("No detailed checkout info available for score \(score).")
                    }
                }
            }
            .padding(10)
            Spacer()
        }
    }
