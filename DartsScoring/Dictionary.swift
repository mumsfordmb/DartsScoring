//
//  Dictionary.swift
//  DartsScoring
//
//  Created by brummel on 13.12.23.
//

import Foundation

// Declare the Checkout struct outside of your DartGame class
struct ArrayCheckout {
    let score: Int
    let methods: [String]
}

let checkoutDictionary: [ArrayCheckout] = [
    ArrayCheckout(score: 2, methods: ["D1"]),
    ArrayCheckout(score: 3, methods: ["S1-D1"]),
    ArrayCheckout(score: 4, methods: ["D2"]),
    ArrayCheckout(score: 5, methods: ["S1-D2"]),
    ArrayCheckout(score: 6, methods: ["D3"]),
    ArrayCheckout(score: 7, methods: ["S3-D2"]),
    ArrayCheckout(score: 8, methods: ["D4"]),
    ArrayCheckout(score: 9, methods: ["S1-D4"]),
    ArrayCheckout(score: 10, methods: ["D5"]),
    ArrayCheckout(score: 10, methods: ["S2-D4"]),
    ArrayCheckout(score: 11, methods: ["S3-D4"]),
    ArrayCheckout(score: 12, methods: ["D6"]),
    ArrayCheckout(score: 13, methods: ["S5-D4"]),
    ArrayCheckout(score: 14, methods: ["D7"]),
    ArrayCheckout(score: 14, methods: ["S6-D4"]),
    ArrayCheckout(score: 15, methods: ["S7-D4"]),
    ArrayCheckout(score: 16, methods: ["D8"]),
    ArrayCheckout(score: 17, methods: ["S1-D8"]),
    ArrayCheckout(score: 17, methods: ["S9-D4"]),
    ArrayCheckout(score: 18, methods: ["D9"]),
    ArrayCheckout(score: 19, methods: ["S3-D8"]),
    ArrayCheckout(score: 19, methods: ["S11-D4"]),
    ArrayCheckout(score: 20, methods: ["D10"]),
    ArrayCheckout(score: 21, methods: ["S5-D8"]),
    ArrayCheckout(score: 21, methods: ["S13-D4"]),
    ArrayCheckout(score: 22, methods: ["D11"]),
    ArrayCheckout(score: 23, methods: ["S7-D8"]),
    ArrayCheckout(score: 24, methods: ["D12"]),
    ArrayCheckout(score: 25, methods: ["S9-D8"]),
    ArrayCheckout(score: 26, methods: ["D13"]),
    ArrayCheckout(score: 27, methods: ["11-D8"]),
    ArrayCheckout(score: 27, methods: ["7-D10"]),
    ArrayCheckout(score: 27, methods: ["19-D4"]),
    ArrayCheckout(score: 28, methods: ["D14"]),
    ArrayCheckout(score: 29, methods: ["13-D8"]),
    ArrayCheckout(score: 30, methods: ["D15"]),
    ArrayCheckout(score: 31, methods: ["S15-D8"]),
    ArrayCheckout(score: 31, methods: ["S19-D6"]),
    ArrayCheckout(score: 32, methods: ["D16"]),
    ArrayCheckout(score: 33, methods: ["S1-D16"]),
    ArrayCheckout(score: 33, methods: ["S17-D8"]),
    ArrayCheckout(score: 34, methods: ["D17"]),
    ArrayCheckout(score: 35, methods: ["S3-D16"]),
    ArrayCheckout(score: 36, methods: ["D18"]),
    ArrayCheckout(score: 37, methods: ["S5-D16"]),
    ArrayCheckout(score: 38, methods: ["D19"]),
    ArrayCheckout(score: 38, methods: ["S6-D16"]),
    ArrayCheckout(score: 38, methods: ["S10-D14"]),
    ArrayCheckout(score: 39, methods: ["S7-D16"]),
    ArrayCheckout(score: 39, methods: ["S19-D10"]),
    ArrayCheckout(score: 40, methods: ["D20"]),
    ArrayCheckout(score: 41, methods: ["S1-D20"]),
    ArrayCheckout(score: 41, methods: ["S9-D16"]),
    ArrayCheckout(score: 42, methods: ["S2-D20"]),
    ArrayCheckout(score: 42, methods: ["S10-D16"]),
    ArrayCheckout(score: 43, methods: ["S3-D20"]),
    ArrayCheckout(score: 43, methods: ["S11-D16"]),
    ArrayCheckout(score: 44, methods: ["S4-D20"]),
    ArrayCheckout(score: 44, methods: ["S12-D16"]),
    ArrayCheckout(score: 45, methods: ["S5-D20"]),
    ArrayCheckout(score: 45, methods: ["S13-D16"]),
    ArrayCheckout(score: 46, methods: ["S6-D20"]),
    ArrayCheckout(score: 46, methods: ["S10-D18"]),
    ArrayCheckout(score: 46, methods: ["S14-D16"]),
    ArrayCheckout(score: 47, methods: ["S7-D20"]),
    ArrayCheckout(score: 47, methods: ["S15-D16"]),
    ArrayCheckout(score: 48, methods: ["S16-D16"]),
    ArrayCheckout(score: 48, methods: ["S8-D20"]),
    ArrayCheckout(score: 49, methods: ["S9-D20"]),
    ArrayCheckout(score: 49, methods: ["S17-D16"]),
    ArrayCheckout(score: 50, methods: ["D25"]),
    ArrayCheckout(score: 50, methods: ["S10-D20"]),
    ArrayCheckout(score: 50, methods: ["S18-D16"]),
    ArrayCheckout(score: 51, methods: ["S11-D20"]),
    ArrayCheckout(score: 51, methods: ["S19-D16"]),
    ArrayCheckout(score: 52, methods: ["S12-D20"]),
    ArrayCheckout(score: 52, methods: ["S20-D16"]),
    ArrayCheckout(score: 53, methods: ["S13-D20"]),
    ArrayCheckout(score: 54, methods: ["S14-D20"]),
    ArrayCheckout(score: 55, methods: ["S15-D20"]),
    ArrayCheckout(score: 56, methods: ["S16-D20"]),
    ArrayCheckout(score: 57, methods: ["S17-D20"]),
    ArrayCheckout(score: 58, methods: ["S18-D20"]),
    ArrayCheckout(score: 59, methods: ["S19-D20"]),
    ArrayCheckout(score: 60, methods: ["S20-D20"]),
    ArrayCheckout(score: 61, methods: ["2-D: T11-D14 Tmiss: [S11-D25]"]),
    ArrayCheckout(score: 61, methods: ["3-D: T15-D18 Tmiss: [S15-S14-D16]"]),
    ArrayCheckout(score: 62, methods: ["2-D: T12-D13 Tmiss: [S12-D25]"]),
    ArrayCheckout(score: 62, methods: ["3-D: T10-D16 Tmiss: [S10-S20-D16]"]),
    ArrayCheckout(score: 63, methods: ["2-D: T13-D12 Tmiss: [S13-D25]"]),
    ArrayCheckout(score: 63, methods: ["3-D: T13-D12 Tmiss: [S13-S18-D16]"]),
    ArrayCheckout(score: 64, methods: ["2-D: T14-D11 Tmiss: [S14-D25]"]),
    ArrayCheckout(score: 64, methods: ["3-D: T16-D8 Tmiss: [S16-S16-D16]"]),
    ArrayCheckout(score: 64, methods: ["Alt: T8-D20 Tmiss: [S8-S16-D20]"]),
    ArrayCheckout(score: 65, methods: ["2-D: S25-D20"]),
    ArrayCheckout(score: 65, methods: ["2-D: T15-D10 Tmiss: [S15-D25]"]),
    ArrayCheckout(score: 65, methods: ["3-D: T11-D16 Tmiss: [S11-S14-D20]"]),
    ArrayCheckout(score: 66, methods: ["2-D: T16-D9 Tmiss: [S16-D25]"]),
    ArrayCheckout(score: 66, methods: ["2-D: T18-D6, S18 lässt 48"]),
    ArrayCheckout(score: 66, methods: ["3-D: T10-D18 Tmiss: [S10-S16-D20]"]),
    ArrayCheckout(score: 67, methods: ["2-D: T17-D8 Tmiss: [S17-D25]"]),
    ArrayCheckout(score: 67, methods: ["3-D: T17-D8 Tmiss: [S17-S18-D16]"]),
    ArrayCheckout(score: 68, methods: ["2-D: T18-D7 Tmiss: [S18-D25]"]),
    ArrayCheckout(score: 68, methods: ["3-D: T20-D4 Tmiss: [S20-S16-D16]"]),
    ArrayCheckout(score: 68, methods: ["Alt: D18-D16 Tmiss: [S18-D25]"]),
    ArrayCheckout(score: 69, methods: ["2-D: T19-D6 Tmiss: [S19-D25]"]),
    ArrayCheckout(score: 69, methods: ["3-D: T15-D12 Tmiss: [S15-S14-D20]"]),
    ArrayCheckout(score: 70, methods: ["2-D: T20-D5 Tmiss: [S20-D25]"]),
    ArrayCheckout(score: 70, methods: ["3-D: T18-D8 Tmiss: [S18-S20-D16]"]),
    ArrayCheckout(score: 71, methods: ["2-D: T13-D16"]),
    ArrayCheckout(score: 71, methods: ["3-D: S13-S18-D20"]),
    ArrayCheckout(score: 72, methods: ["2-D: T16-D12"]),
    ArrayCheckout(score: 72, methods: ["3-D: S16-S16-D20"]),
    ArrayCheckout(score: 73, methods: ["2-D: T17-D11"]),
    ArrayCheckout(score: 73, methods: ["3-D: S17-S16-D20"]),
    ArrayCheckout(score: 73, methods: ["Alt: T19-D8 Tmiss: [S19-S14-D20]"]),
    ArrayCheckout(score: 74, methods: ["2-D: T14-D16"]),
    ArrayCheckout(score: 74, methods: ["3-D: S14-S20-D20"]),
    ArrayCheckout(score: 75, methods: ["2-D: T17-D12"]),
    ArrayCheckout(score: 75, methods: ["3-D: S17-S18-D20"]),
    ArrayCheckout(score: 76, methods: ["2-D: T20-D8"]),
    ArrayCheckout(score: 76, methods: ["3-D: S20-S16-D20"]),
    ArrayCheckout(score: 77, methods: ["2-D: T19-D10"]),
    ArrayCheckout(score: 77, methods: ["3-D: S19-S18-D20"]),
    ArrayCheckout(score: 78, methods: ["2-D: T18-D12"]),
    ArrayCheckout(score: 78, methods: ["3-D: S18-S20-D20"]),
    ArrayCheckout(score: 79, methods: ["2-D: T13-D20"]),
    ArrayCheckout(score: 79, methods: ["3-D: T19-D11 Tmiss: [S19-S20-D20]"]),
    ArrayCheckout(score: 80, methods: ["2-D: T16-D16 or: D20-D20"]),
    ArrayCheckout(score: 80, methods: ["3-D: T20-D10 Tmiss: [S20-S20-D20]"]),
    ArrayCheckout(score: 81, methods: ["2-D: T19-D12"]),
    ArrayCheckout(score: 81, methods: ["3-D: S19-T12-D13"]),
    //ArrayCheckout(score: 81, methods: ["Alt: T15-D18 Tmiss: [S15-T16-D9]"]),
    ArrayCheckout(score: 82, methods: ["2-D: D25-D16"]),
    ArrayCheckout(score: 82, methods: ["3-D: S25-S17-D20"]),
    ArrayCheckout(score: 82, methods: ["2-Alt1: T14-D20"]),
    ArrayCheckout(score: 82, methods: ["3-Alt1: S14-T18-D7"]),
    ArrayCheckout(score: 82, methods: ["2-Alt2: T18-D14"]),
    ArrayCheckout(score: 82, methods: ["3-Alt2: S18-T14-D11"]),
    ArrayCheckout(score: 83, methods: ["2-D: T17-D16"]),
    ArrayCheckout(score: 83, methods: ["3-D: S17-T16-D9"]),
    ArrayCheckout(score: 84, methods: ["2-D: T20-D12"]),
    ArrayCheckout(score: 84, methods: ["3-D: S20-T14-D11"]),
    //ArrayCheckout(score: 84, methods: ["Alt: T16-D18 Tmiss: [S16-T18-D7]"]),
    ArrayCheckout(score: 85, methods: ["2-D: T15-D20"]),
    ArrayCheckout(score: 85, methods: ["3-D: S15-T20-D5"]),
    ArrayCheckout(score: 86, methods: ["2-D: T18-D16"]),
    ArrayCheckout(score: 86, methods: ["3-D: S18-T18-D7"]),
    ArrayCheckout(score: 87, methods: ["2-D: T17-D18"]),
    ArrayCheckout(score: 87, methods: ["3-D: S17-T20-D5"]),
    ArrayCheckout(score: 88, methods: ["2-D: T20-D14"]),
    ArrayCheckout(score: 88, methods: ["3-D: S20-T18-D7"]),
    //ArrayCheckout(score: 88, methods: ["Opt: T16-D20 Tmiss: [S16] > 71!"]), // Kann man entfernen.
    ArrayCheckout(score: 89, methods: ["2-D: T19-D16"]),
    ArrayCheckout(score: 89, methods: ["3-D: S19-T20-D5"]),
    ArrayCheckout(score: 90, methods: ["2-D: T18-D18"]),
    ArrayCheckout(score: 90, methods: ["3-D: S20-T20-D5"]),
    ArrayCheckout(score: 91, methods: ["2-D: T17-D20"]),
    ArrayCheckout(score: 91, methods: ["3-D: S17-T14-D16"]),
    ArrayCheckout(score: 92, methods: ["2-D: T20-D16"]),
    ArrayCheckout(score: 92, methods: ["3-D: S20-T16-D12"]),
    ArrayCheckout(score: 93, methods: ["2-D: T19-D18"]), //
    ArrayCheckout(score: 93, methods: ["3-D: S19-T14-D16"]),
    ArrayCheckout(score: 94, methods: ["2-D: T18-D20"]),
    ArrayCheckout(score: 94, methods: ["3-D: S18-T20-D8"]),
    ArrayCheckout(score: 95, methods: ["2-D: T19-D19"]),
    ArrayCheckout(score: 95, methods: ["3-D: S19-T20-D8"]),
    ArrayCheckout(score: 96, methods: ["2-D: T20-D18"]),
    ArrayCheckout(score: 96, methods: ["3-D: S20-T20-D8"]),
    ArrayCheckout(score: 97, methods: ["2-D: T19-D20"]),
    ArrayCheckout(score: 97, methods: ["3-D: S19-T20-D8"]),
    ArrayCheckout(score: 98, methods: ["2-D: T20-D19"]),
    ArrayCheckout(score: 98, methods: ["3-D: S20-T18-D12"]),
    ArrayCheckout(score: 99, methods: ["3-D: T19-S10-D16 Tmiss: [S19-T20-D10]"]),
    ArrayCheckout(score: 100, methods: ["2-D: T20-D20"]),
    ArrayCheckout(score: 100, methods: ["3-D: S20-T20-D10"]),
    ArrayCheckout(score: 100, methods: ["Alt: Tmiss: [S20-T16-D16]"]),
    ArrayCheckout(score: 101, methods: ["2-D: T17-D25"]),
    ArrayCheckout(score: 101, methods: ["3-D: T20-S9-D16 Tmiss: [S20-T17-D15]"]),
    ArrayCheckout(score: 102, methods: ["3-D: T20-S10-D16 Tmiss: [S20-T14-D20]"]),
    ArrayCheckout(score: 103, methods: ["3-D: T19-S14-D16 Tmiss: [S19-T20-D12]"]),
    ArrayCheckout(score: 104, methods: ["2-D: T18-D25"]),
    ArrayCheckout(score: 104, methods: ["3-D: T18-S18-D16 Tmiss: [S18-T18-D16]"]),
    ArrayCheckout(score: 104, methods: ["Alt: T19-S15-D16 Tmiss: [S19-T15-D20]"]),
    ArrayCheckout(score: 105, methods: ["3-D: T20-S13-D16 Tmiss: [S20-T15-D20]"]),
    ArrayCheckout(score: 106, methods: ["3-D: T20-S14-D16 Tmiss: [S20-T18-D16]"]),
    ArrayCheckout(score: 107, methods: ["2-D: T19-D25"]),
    ArrayCheckout(score: 107, methods: ["3-D: T19-S18-D16 Tmiss: [S19-T20-D19]"]),
    ArrayCheckout(score: 108, methods: ["3-D: T20-S16-D16 Tmiss: [S20-T20-D14]"]),
    ArrayCheckout(score: 108, methods: ["Alt: T18-S14-D20 Tmiss: [S18-T18-D18]"]),
    ArrayCheckout(score: 109, methods: ["3-D: T20-S9-D20 Tmiss: [S20-T19-D16]"]),
    ArrayCheckout(score: 109, methods: ["Alt: T19-S20-D16 Tmiss: [S19-T18-D18]"]),
    ArrayCheckout(score: 110, methods: ["2-D: T20-Bull"]),
    ArrayCheckout(score: 110, methods: ["3-D: T20-S10-D20 Tmiss: [S20-T18-D18]"]),
    ArrayCheckout(score: 111, methods: ["3-D: T20-S11-D20 Tmiss: [S20-T17-D20]"]),
    ArrayCheckout(score: 111, methods: ["Alt: T19-S14-D20 Tmiss: [S19-T20-D16]"]),
    ArrayCheckout(score: 112, methods: ["3-D: T20-S12-D20 Tmiss: [S20-T20-D16]"]),
    ArrayCheckout(score: 113, methods: ["3-D: T19-S16-D20 Tmiss: [S19-T18-D20]"]),
    ArrayCheckout(score: 114, methods: ["3-D: T20-S14-D20 Tmiss: [S20-T18-D20]"]),
    ArrayCheckout(score: 115, methods: ["3-D: T20-S15-D20 Tmiss: [S20-T19-D19]"]),
    ArrayCheckout(score: 115, methods: ["Alt: T19-S18-D20 Tmiss: [S19-T20-D18]"]),
    ArrayCheckout(score: 116, methods: ["3-D: T19-S19-D20 Tmiss: [S19-T19-D20]"]),
    ArrayCheckout(score: 116, methods: ["Alt: T20-S16-D20 Tmiss: [S20-T20-D18]"]),
    ArrayCheckout(score: 117, methods: ["3-D: T20-S17-D20 Tmiss: [S20-T19-D20]"]),
    ArrayCheckout(score: 118, methods: ["3-D: T20-S18-D20 Tmiss: [S20-T20-D19]"]),
    ArrayCheckout(score: 119, methods: ["3-D: T19-T12-D13 Tmiss: [S19-T20-D20]"]),
    ArrayCheckout(score: 120, methods: ["3-D: T20-S20-D20 Tmiss: [S20-T20-D20]"]),
    ArrayCheckout(score: 121, methods: ["3-D: T20-T11-D14 Tmiss: [S20-T17-D25]"]),
    ArrayCheckout(score: 121, methods: ["Alt: T17-T20-D5 Tmiss: [T17-S20-D25]"]),
    ArrayCheckout(score: 122, methods: ["3-D: T18-T18-D7 Tmiss: [S18-T18-D25]"]),
    ArrayCheckout(score: 122, methods: ["Alt: T15-T15-D16 Tmiss: [S25-T19-D20]"]),
    ArrayCheckout(score: 123, methods: ["3-D: T19-T16-D9 Tmiss: [T19-S16-D25]"]),
    ArrayCheckout(score: 123, methods: ["Alt: T16-T17-D12 Tmiss: [S16-T19-D25]"]),
    ArrayCheckout(score: 124, methods: ["3-D: T20-T16-D8 Tmiss: [S20-T18-D25]"]),
    ArrayCheckout(score: 125, methods: ["3-D: D25-T17-D12 Tmiss: [S25-T20-D20]"]),
    ArrayCheckout(score: 125, methods: ["Alt: T15-T16-D16 Tmiss: [S15-T20-D25]"]),
    ArrayCheckout(score: 126, methods: ["3-D: T19-T19-D6 Tmiss: [S19-T19-D25]"]),
    ArrayCheckout(score: 126, methods: ["Alt: T16-T18-D12 Tmiss: [S16-T20-D25]"]),
    ArrayCheckout(score: 127, methods: ["3-D: T20-T17-D8 Tmiss: [S20-T19-D25]"]),
    ArrayCheckout(score: 128, methods: ["3-D: T18-T14-D16 Tmiss: [S18-T20-D25]"]),
    ArrayCheckout(score: 128, methods: ["Alt: T18-T18-D10"]),
    ArrayCheckout(score: 129, methods: ["3-D: T19-T16-D12 Tmiss: [S19-T20-D25]"]),
    ArrayCheckout(score: 129, methods: ["Alt: D19-T17-D20"]),
    ArrayCheckout(score: 130, methods: ["3-D: T20-T20-D5 Tmiss: [S20-T20-D25]"]),
    ArrayCheckout(score: 130, methods: ["Alt: T20-T10-D20"]),
    ArrayCheckout(score: 131, methods: ["3-D: T20-T13-D16"]),
    ArrayCheckout(score: 132, methods: ["3-D: D25-T14-D20 Tmiss: [S25-T19-D25]"]),
    ArrayCheckout(score: 133, methods: ["3-D: T20-T11-D20"]),
    ArrayCheckout(score: 134, methods: ["3-D: T20-T14-D16"]),
    ArrayCheckout(score: 135, methods: ["3-D: D25-T15-D20"]),
    ArrayCheckout(score: 136, methods: ["3-D: T20-T20-D8"]),
    ArrayCheckout(score: 137, methods: ["3-D: T20-T15-D16"]),
    ArrayCheckout(score: 138, methods: ["3-D: T20-T18-D12"]),
    ArrayCheckout(score: 139, methods: ["3-D: T19-T14-D20"]),
    ArrayCheckout(score: 140, methods: ["3-D: T20-T20-D10"]),
    ArrayCheckout(score: 140, methods: ["Alt: T18-T18-D16"]),
    ArrayCheckout(score: 141, methods: ["3-D: T20-T19-D12"]),
    ArrayCheckout(score: 141, methods: ["Alt: T19-T16-D18"]),
    ArrayCheckout(score: 141, methods: ["Alt: T18-T17-D18"]),
    ArrayCheckout(score: 142, methods: ["3-D: T18-T20-D14"]),
    ArrayCheckout(score: 142, methods: ["Alt: T17-T17-D20"]),
    ArrayCheckout(score: 142, methods: ["Alt: T20-T14-D20"]),
    ArrayCheckout(score: 143, methods: ["3-D: T20-T17-D16"]),
    ArrayCheckout(score: 143, methods: ["Alt: T19-T17-D18"]),
    ArrayCheckout(score: 144, methods: ["3-D: T20-T20-D12"]),
    ArrayCheckout(score: 144, methods: ["Alt: T19-T17-D18"]),
    ArrayCheckout(score: 145, methods: ["3-D: T19-T20-D14"]),
    ArrayCheckout(score: 145, methods: ["Alt: T20-T15-D20"]),
    ArrayCheckout(score: 145, methods: ["Alt: T18-T17-D20"]),
    ArrayCheckout(score: 146, methods: ["3-D: T19-T19-D16"]),
    ArrayCheckout(score: 146, methods: ["Alt: T20-T18-D16"]),
    ArrayCheckout(score: 147, methods: ["3-D: T20-T17-D18"]),
    ArrayCheckout(score: 147, methods: ["Alt: T19-T18-D18"]),
    ArrayCheckout(score: 148, methods: ["3-D: T20-T16-D20"]),
    ArrayCheckout(score: 148, methods: ["Alt: T18-T18-D20"]),
    ArrayCheckout(score: 149, methods: ["3-D: T20-T19-D16"]),
    ArrayCheckout(score: 150, methods: ["3-D: T20-T18-D18"]),
    ArrayCheckout(score: 150, methods: ["Alt: T19-T19-D18"]),
    ArrayCheckout(score: 151, methods: ["3-D: T20-T17-D20"]),
    ArrayCheckout(score: 151, methods: ["Alt: T19-T18-D20"]),
    ArrayCheckout(score: 152, methods: ["3-D: T20-T20-D16"]),
    ArrayCheckout(score: 152, methods: ["Alt: T19-T18-D19"]),
    ArrayCheckout(score: 153, methods: ["3-D: T20-T19-D18"]),
    ArrayCheckout(score: 154, methods: ["3-D: T20-T18-D20"]),
    ArrayCheckout(score: 154, methods: ["Alt: T19-T19-D20"]),
    ArrayCheckout(score: 155, methods: ["3-D: T20-T19-D19"]),
    ArrayCheckout(score: 156, methods: ["3-D: T20-T20-D18"]),
    ArrayCheckout(score: 157, methods: ["3-D: T20-T19-D20"]),
    ArrayCheckout(score: 158, methods: ["3-D: T20-T20-D19"]), //
    ArrayCheckout(score: 159, methods: ["Kein Finish"]),
    ArrayCheckout(score: 160, methods: ["3-D: T20-T20-D20"]), //
    ArrayCheckout(score: 161, methods: ["3-D: T20-T17-D25"]), //
    ArrayCheckout(score: 161, methods: ["3-D: T19-T18-D25"]), //
    ArrayCheckout(score: 162, methods: ["Kein Finish"]),
    ArrayCheckout(score: 163, methods: ["Kein Finish"]),
    ArrayCheckout(score: 164, methods: ["3-D: T20-T18-D25"]), //
    ArrayCheckout(score: 164, methods: ["3-D: T19-T19-D25"]), //
    ArrayCheckout(score: 165, methods: ["Kein Finish"]),
    ArrayCheckout(score: 166, methods: ["Kein Finish"]),
    ArrayCheckout(score: 167, methods: ["3-D: T20-T19-D25"]), //
    ArrayCheckout(score: 168, methods: ["Kein Finish"]),
    ArrayCheckout(score: 169, methods: ["Kein Finish"]),
    ArrayCheckout(score: 170, methods: ["3-D: T20-T20-Bull"]) //
    ]
    
    struct ScoreDetail {
        var description: String
        // Add more fields as necessary
    }
    
    // Define your details for each score
    let scoreDetails: [Int: ScoreDetail] = [
        0: ScoreDetail(description: "[TEST]"),
        3: ScoreDetail(description: "[S1-D1]: Es gibt keine andere Möglichkeit die 3 zu Finishen."),
        5: ScoreDetail(description: "[S1-D2]: Es gibt keine sinnvollere Möglichkeit eine 5 zu Finishen."),
        6: ScoreDetail(description: "[S2-D2]: Es ist zu empfehlen umzubauen und über [S2-D2] zu Finishen."),
        9: ScoreDetail(description: "[S1-D4]: Es ist sinnvoll, sich immer das grostmögliche vielfache von 2 als Finish zu stellen."),
        10: ScoreDetail(description: "[D5]"),
        14: ScoreDetail(description: "[D7]"),
        17: ScoreDetail(description: "[S1-D8]"),
        19: ScoreDetail(description: "[S3-D8]"),
        21: ScoreDetail(description: "[S5-D8]"),
        27: ScoreDetail(description: "[S11-D8]"),
        31: ScoreDetail(description: "[S15-D8]"),
        33: ScoreDetail(description: "[S1-D16]"),
        38: ScoreDetail(description: "[D19]"),
        39: ScoreDetail(description: "[S7-D16]"),
        46: ScoreDetail(description: "[S14-D16]"),
        47: ScoreDetail(description: "[S15-D16]"),
        49: ScoreDetail(description: "[S17-D16]"),
        50: ScoreDetail(description: "[S18-D16]"),
        51: ScoreDetail(description: "[S19-D16]"),
        52: ScoreDetail(description: "[S20-D16]"),
        56: ScoreDetail(description: "[S16-D20]: Beim treffen der [T16] bleiben [D4] (8) Rest."),
        60: ScoreDetail(description: "[S20-D20]: Auf jeden Fall hoch zielen um nicht die [T20] zu treffen. Eine [D20] würde [D10] (20) Rest lassen."),
        65: ScoreDetail(description: "[S25-D20]: Es ist auch möglich über das Singlebull zu spielen!"),
        66: ScoreDetail(description: "[T18-D6]: [S18] lässt (48) Rest für [S16-D16]"),
        68: ScoreDetail(description: "[T18-D7]: Alternativ auch [D18-D16]."),
        79: ScoreDetail(description: "[T19-D11]: [D11] ist ein ungewöhnliches Double. Aber nur dieser Weg garantiert einen Rest unter (61) nach dem ersten Dart."),
        80: ScoreDetail(description: "[T20-D10]: Der einzige Weg, der ein normales (nicht Bull Double) garantiert. Ebenfalls möglich ist [T16-D16], was beim Treffen der [S16] (64) Rest lässt. Diese kann nicht mit einem Single und Double gefinisht werden, sondern benötigt ein Triple oder ein Bull."),
        82: ScoreDetail(description: "Wer wie Marlo, aka Slim Shady der 2te, auf der [D25] so stark ist, dass er zumindest noch die [S25] trifft, kann versuchen [D25-D16] zu treffen. Beim Treffen der [S25] bleiben (57) Rest , welche mit [S17-D20] gefinisht werden können. Wer auf der [D25] nicht so stark ist oder nur 2 Darts übrig hat, sollte einen der anderen Wege spielen."),
        88: ScoreDetail(description: "[T16-D20]: Ist sehr beliebt, birgt jedoch das Risiko beim Treffen der [S16] nicht unter (71) Rest zu kommen."),
        90: ScoreDetail(description: "[T20-D15] Tmiss: [S20-T20-D5]. Hat man nur 2 Darts übrig so sollte man über [T18-D18] spielen."),
        95: ScoreDetail(description: "[T19-D19]: Wirkt ungewöhnlich, ist aber die einzige Möglichkeit für ein 2-Dart finish."),
        99: ScoreDetail(description: "[T19-S10-D16]: 99 ist die einzige, zweistellige Zahl, welche nicht mit 2 Darts gefinisht werden kann."),
        104: ScoreDetail(description: "[T19-S15-D16] hat den Vorteil, dass sowohl beim Treffen der [S19], [S3] und [S7] ein 2-Dart finish möglich bleibt."),
        113: ScoreDetail(description: "[T19-S16-D20]: Dies ist der sicherste Weg, da beide Nachbartriple [T3] und [T7] ein 2-Dart finsih lassen."),
        118: ScoreDetail(description: "[T20-S18-D20]: Viele Spieler denken, dass es sinnvoll ist zuerst auf die [T18] zu spielen, da das Treffen der [S18] noch (100) Rest lässt. Trifft man allerdings die [T18] hat man (64) Punkte Rest, welche nicht mit einem Single und einem Double gefinisht werden können!"),
        119: ScoreDetail(description: "[T19-T12-D13]: Die einzige Zahl in diesem Bereich, welche nicht mit einem Triple, einem Single und einem Double gefinisht werden kann. Die [T19] lässt (62) Rest. Der Wurf auf die [T12] garantiert immerhin noch ein Bullfinish, falls die [S12] getroffen wird."),
        120: ScoreDetail(description: "[T20-S20-D20]: Das sogenannte Shanghai-Finish kann mit Triple, Single und Double [20] gefinisht werden, wobei die Reihenfolge der ersten beiden Darts egal ist."),
    ]
    struct ScoreDetail2 {
        var description: String
        // Add more fields as necessary
    }

    // Define your details for each score
    let scoreDetails2: [Int: ScoreDetail2] = [
        0: ScoreDetail2(description: "[TEST]"),
        6: ScoreDetail2(description: "[D3]: D3 ist sehr unbeliebt."),
        7: ScoreDetail2(description: "Vermeide es über [S1-D3] zu spielen, da D3 als Finish sehr ungünstig liegt."),
        10: ScoreDetail2(description: "[S2-D4]: Hier hängt es von der Anzahl der Versuche und Präferenz des Spielers ab."),
        14: ScoreDetail2(description: "[S6-D4]: Falls man nicht über die D7 Finishen möchte, kann man versuchen über die [S6] auf eine [D4] als Finish umzubauen. Dennoch gilt es die D7 als Finisher zu üben."),
        17: ScoreDetail2(description: "[S9-D4]: Hier gilt es die [D8] als Finisher zu üben. Allerdings gibt es die Möglichkeit über [S9] auf [D4] als Finisher zu spielen. Trifft man nämlich statt der [S9] eines der benachbarten Felder [12]/[14] kann man noch immer Finishen. Verfehlt man hingegen die [S1] und trifft hier ein benachbartes Feld, hat man überworfen."),
        19: ScoreDetail2(description: "[S11-D4]: Das Risiko durch einen Fehlwurf in ein Nachbarfeld zu überwerfen, besteht bei diesem Weg nicht."),
        21: ScoreDetail2(description: "[S13-D4]: Das Risiko durch einen Fehlwurf in ein Nachbarfeld zu überwerfen, besteht bei diesem Weg nicht."),
        27: ScoreDetail2(description: "[S19-D4]: Profis spielen über [S11-D8]. Ungeübte Spieler sollten auf die [S7] bzw. [S19] spielen, denn egal welches der beiden Felder man trifft, man erhält jeweils ein spielbares Double."),
        31: ScoreDetail2(description: "[S19-D6]: [S15-D8] ist der Standardweg. [S19-D6] hat jedoch den Vorteil, dass die Nachbarfelder der [19] auch ein gutes Doublefeld lassen, während die Nachbarfelder der [15] eine ungerade Zahl Rest lassen."),
        33: ScoreDetail2(description: "[S17-D8]: Für ungeübte Spieler lässt der Weg über [S17-D8] auch beim Treffen der [S3] mit dem ersten Dart ein Finish."),
        38: ScoreDetail2(description: "[S10-D14]: Es ist sinnvol die [D19] zu treffen. Zielt man allerdings mit dem ersten Dart auf die [S10] oder [S6] kann man versuchen sich ein besseres Double stellen."),
        39: ScoreDetail2(description: "[S19-D10]: Ungeübte Spieler können zwischen [S7] und [S19] zielen und sich so sicher ein Double zu stellen."),
        46: ScoreDetail2(description: "[S6-D20] oder [S10-D18]: Sowohl die 6 als auch die 10 ergeben ein beliebtes Double."),
        47: ScoreDetail2(description: "[S7-D20]: Der Vorteil ist, dass auch das Nachbarfeld der S7 [S19] ein Finish [D14] bringt."),
        49: ScoreDetail2(description: "[S9-D20]: Auch wenn [S17] das bessere Double stellt, riskiert man beim Treffen der [T17] sich zu überwerfen. Dieses Risiko besteht bei [S9-D20] nicht."),
        50: ScoreDetail2(description: "[S10-D20] oder [BULL]: In der Regel sollte man hier nicht direkt auf das Bullseye werfen. Zusätzlich gilt das gleiche wie bei 49 Rest, das Treffen der [T18] würde das Ende dieses Durchgangs bedeuten."),
        51: ScoreDetail2(description: "[S11-D20]: Auch hier riskiert man beim ersten Weg sich mit einem Triple zu überwerfen."),
        52: ScoreDetail2(description: "[S12-D20]: Auch hier beendet die T20 den Durchgang. Beim Zielen auf die [S12] kann man auch auf die [T12] zielen, welche [D8] (16) Rest lässt."),
        79: ScoreDetail2(description: "[T13-D20]: Bei zwei Dart Rest kann man versuchen sich über [T13] ein besseres Double zu stellen, da man ohne Treffen des Triples ohnehin kein Doublefeld Rest lassen kann."),
        80: ScoreDetail2(description: "[D20-D20]: Da man ohnehin keinen Wurf auf ein Double bekommt, wenn man mit dem ersten Dart kein Triple trifft, kann man bei 2 Dart Rest diesen Weg gehen."),
        95: ScoreDetail2(description: "[S19-T20-D8] als Korrekturweg."),
    ]

