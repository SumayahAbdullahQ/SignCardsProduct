//
//  HomeScreen.swift
//  SignCardsProduct
//
//  Created by Sumayah Alqahtani on 03/04/1446 AH.
//

import SwiftUI
struct HomeScreen: View {
    @EnvironmentObject var cardStore: CardStore // Access the shared CardStore
    @EnvironmentObject var cardStore2: CardStore2 // Access the shared CardStore
    @EnvironmentObject var cardStore3: CardStore3 // Access the shared CardStore
    @EnvironmentObject var cardStore4: CardStore4 // Access the shared CardStore

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                HStack(spacing: 40){
                    NavigationLink(destination: MyCardScreen()) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.pink.opacity(0.2))
                            .frame(width: 150, height: 150)
                            .overlay(
                                Text("🍎")
                                    .font(.system(size: 60))
                            )
                        
                    }
                    NavigationLink(destination: MyCardScreen2()) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow.opacity(0.2))
                            .frame(width: 150, height: 150)
                            .overlay(
                                Text("👔")
                                    .font(.system(size: 60))
                            )
                        
                    }
                }
                HStack(spacing: 40){
                    NavigationLink(destination: MyCardScreen3()) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green.opacity(0.2))
                            .frame(width: 150, height: 150)
                            .overlay(
                                Text("❓")
                                    .font(.system(size: 60))
                            )
                        
                    }
                    NavigationLink(destination: MyCardScreen4()) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 150, height: 150)
                            .overlay(
                                Text("🩺")
                                    .font(.system(size: 60))
                            )
                        
                    }
                }
            }
            .navigationTitle("My Folder")
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(CardStore())
    // Provide a CardStore for preview
        .environmentObject(CardStore2())
        .environmentObject(CardStore3())
        .environmentObject(CardStore4())
}
