//
//  SignCardsProductApp.swift
//  SignCardsProduct
//
//  Created by Sumayah Alqahtani on 03/04/1446 AH.
//

import SwiftUI

@main
struct SignCardsTestApp: App {
    @StateObject var cardStore = CardStore()// Create a shared instance of CardStore
    @StateObject var cardStore2 = CardStore2()// Create a shared instance of CardStore2
    @StateObject var cardStore3 = CardStore3()// Create a shared instance of CardStore3
    @StateObject var cardStore4 = CardStore4()// Create a shared instance of CardStore4


    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(cardStore) // Pass the CardStoreto HomeScreen
                .environmentObject(cardStore2) // Pass the CardStoreto2 HomeScreen
                .environmentObject(cardStore3) // Pass the CardStoreto3 HomeScreen
                .environmentObject(cardStore4) // Pass the CardStoreto4 HomeScreen
        }
    }
}
