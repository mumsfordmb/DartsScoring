import SwiftUI
import AudioToolbox

struct GameSetupView: View {
    @Binding var isPresented: Bool
    @ObservedObject var game: DartGame
    
    @State private var numberOfPlayers: Int = 1
    @State private var gameType: String = "1"
    @State private var playerNames: [String] = Array(repeating: "", count: 1) // initialize with 1 since initial numberOfPlayers is 1
    
    @Environment(\.editMode) var mode
    
    init(isPresented: Binding<Bool>, game: DartGame) {
            _isPresented = isPresented
            _game = ObservedObject(wrappedValue: game)
            _numberOfPlayers = State(initialValue: game.players.count)
            _playerNames = State(initialValue: UserDefaults.standard.stringArray(forKey: "PlayerNames") ?? [])
        }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Number of Players")) {
                    Picker(selection: $numberOfPlayers, label: Text("Number of Players")) {
                        ForEach(1..<9) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: numberOfPlayers) { newNumberOfPlayers in
                        if playerNames.count < newNumberOfPlayers {
                                for i in playerNames.count..<newNumberOfPlayers {
                                    playerNames.append("Player \(i + 1)")
                                }
                            //savePlayerNames()
                        } else {
                            playerNames = Array(playerNames.prefix(newNumberOfPlayers))
                            // Adjust currentPlayerIndex if it's now out of range:
                            if game.currentPlayerIndex >= newNumberOfPlayers {
                                game.currentPlayerIndex = newNumberOfPlayers - 1
                                print("Player Index adjusted to: \(newNumberOfPlayers)")
                            }
                        }
                    }
                }
                
                
                Section(header: Text("Game Type")) {
                    Picker(selection: $gameType, label: Text("Game Type")) {
                        Text("501 Double Out").tag("1")
                        Text("501 Straight Out").tag("2")
                    }
                    .pickerStyle(SegmentedPickerStyle())

                }
                
                Section(header: Text("Player Names")) {
                    ForEach(0..<numberOfPlayers, id: \.self) { index in
                        if self.mode?.wrappedValue == .active {
                            if index < playerNames.count {
                                TextField("Player Name", text: $playerNames[index])
                                    .keyboardType(.alphabet)
                            }
                        } else {
                            if index < playerNames.count {
                                Text(playerNames[index])
                            }
                        }
                    }
                    .onMove(perform: movePlayer)
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    // This will switch between .inactive and .active
                    self.mode?.wrappedValue = self.mode?.wrappedValue == .active ? .inactive : .active
                }) {
                    //Text(self.mode?.wrappedValue == .inactive ? "Edit" : "Done")
                    Image(systemName: self.mode?.wrappedValue == .inactive ? "person.crop.circle.badge.plus" : "person.crop.circle.badge.checkmark")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.primary, Color.blue)
                },
                trailing: Button(action: {
                    setupGame()
                    isPresented = false
                }) {
                    // Start Game:
                    Image(systemName: "play.circle")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.primary, Color.blue)
                }
            )
            .navigationBarTitle("Setup Game", displayMode: .inline)
            .onAppear {
                //loadSavedPlayerNames()
                //savePlayerNames()
                //print(".onAppear91")
            }
        }
    }
    
    func setupGame() {
            let selectedPlayerNames = Array(playerNames.prefix(numberOfPlayers))
            if gameType == "1" {
                game.startNewGame(numberOfPlayers: numberOfPlayers, gameType: .standard, playerNames: selectedPlayerNames)
                    print("Trigger: func setupGame1")
                    savePlayerNames()
            } else {
                game.startNewGame(numberOfPlayers: numberOfPlayers, gameType: .singleOut, playerNames: selectedPlayerNames)
                    print("Trigger: func setupGame2")
                    savePlayerNames()
            }
        }
    
    func movePlayer(from source: IndexSet, to destination: Int) {
        print("Trigger: func movePlayer")
        playerNames.move(fromOffsets: source, toOffset: destination)
        savePlayerNames()
    }
    
    func loadSavedPlayerNames() {
        if let savedNames = UserDefaults.standard.array(forKey: "PlayerNames") as? [String] {
            print("Trigger: func loadSavedPlayerNames")
            playerNames = Array(savedNames.prefix(8))
        }
    }
    
    func savePlayerNames() {
        UserDefaults.standard.set(playerNames, forKey: "PlayerNames")
        print("128")
    }
}
