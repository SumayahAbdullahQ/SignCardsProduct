//
//  MyCardScreen.swift
//  SignCardsProduct
//
//  Created by Sumayah Alqahtani on 03/04/1446 AH.
//

import SwiftUI

struct MyCardScreen: View {
    @EnvironmentObject var cardStore: CardStore

    var body: some View {
            VStack {
                Text("My Cards")
                    .font(.largeTitle)
                    .padding()

                // Display list of saved cards with NavigationLink to CardDetailView
                List(cardStore.cards) { card in
                    NavigationLink(destination: CardDetailView(card: card)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(card.color)
                                .frame(width: 300, height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )

                            Text(card.description)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .frame(width: 280)
                                .frame(maxHeight: .infinity, alignment: .center)
                        }
                        .padding(.vertical, 5) // Space between cards
                    }
                }

                Spacer()

                // Button to go to AddCardScreen
                NavigationLink(destination: AddCardScreen()) {
                    Text("Add New Card")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
}

#Preview {
    MyCardScreen()
        .environmentObject(CardStore()) // Ensure that you provide the environment object
}
