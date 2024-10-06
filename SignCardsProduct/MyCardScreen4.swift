//
//  MyCardScreen4.swift
//  SignCardsProduct
//
//  Created by Sumayah Alqahtani on 03/04/1446 AH.
//

import SwiftUI

struct MyCardScreen4: View {
    @EnvironmentObject var cardStore4: CardStore4

    var body: some View {
            VStack {
                Text("My Cards")
                    .font(.largeTitle)
                    .padding()

                // Display list of saved cards
                List(cardStore4.cards4) { card4 in
                    NavigationLink(destination: CardDetailView4(card4: card4)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(card4.color)
                                .frame(width: 300, height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                            // Center the card description text both horizontally and vertically
                            Text(card4.description)
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
                NavigationLink(destination: AddCardScreen4()) {
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
    MyCardScreen4()
        .environmentObject(CardStore4()) // Ensure that you provide the environment object
}
