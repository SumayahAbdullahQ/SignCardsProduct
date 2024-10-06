//
//  MyCardScreen2.swift
//  SignCardsProduct
//
//  Created by Sumayah Alqahtani on 03/04/1446 AH.
//

import SwiftUI

struct MyCardScreen2: View {
    @EnvironmentObject var cardStore2: CardStore2

    var body: some View {
            VStack {
                Text("My Cards")
                    .font(.largeTitle)
                    .padding()

                // Display list of saved cards
                List(cardStore2.cards2) { card2 in
                    NavigationLink(destination: CardDetailView2(card2: card2)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(card2.color)
                                .frame(width: 300, height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                            // Center the card description text both horizontally and vertically
                            Text(card2.description)
                                .font(.headline)
                                .multilineTextAlignment(.center) // Center horizontally
                                .frame(width: 280) // Adjust text width to fit the card
                                .frame(maxHeight: .infinity, alignment: .center) // Center vertically
                        }
                        .padding(.vertical, 5) // Space between cards
                    }
                }

                Spacer()

                // Button to go to AddCardScreen
                NavigationLink(destination: AddCardScreen2()) {
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
    MyCardScreen2()
        .environmentObject(CardStore2()) // Ensure that you provide the environment object
}
