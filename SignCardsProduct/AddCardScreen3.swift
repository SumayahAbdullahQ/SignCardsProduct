//
//  AddCardScreen3.swift
//  SignCardsProduct
//
//  Created by Sumayah Alqahtani on 03/04/1446 AH.
//

import SwiftUI

// Define a simple Card model
struct Card3: Identifiable {
    var id = UUID()
    var color: Color
    var description: String
}

// A shared store to hold the cards
class CardStore3: ObservableObject {
    @Published var cards3: [Card3] = []
}
import SwiftUI

struct AddCardScreen3: View {
    @State var cardColor: Color = .white
    @State var cardColorArray: [Color] = [
        .red.opacity(0.5), .orange.opacity(0.5), .yellow.opacity(0.5),
        .brown.opacity(0.5), .gray.opacity(0.5), .green.opacity(0.5),
        .mint.opacity(0.5), .blue.opacity(0.5), .indigo.opacity(0.5),
        .purple.opacity(0.5)
    ]
    @State private var cardDescription: String = ""
    @State private var emojiInput: String = ""
    @EnvironmentObject var cardStore3: CardStore3
    @Environment(\.presentationMode) var presentationMode // To dismiss the current screen
    

    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss() // Cancel button action
                } label: {
                    Text("Cancel")
                        .padding(.vertical)
                        .padding(.horizontal)
                }

                Spacer()

                Button {
                    // Save the card and go back to the previous screen
                    let newCard3 = Card3(color: cardColor, description: "\(emojiInput)\n\n\(cardDescription)") // Adding a new line
                    cardStore3.cards3.append(newCard3)
                    presentationMode.wrappedValue.dismiss() // Go back to the previous screen (MyCardScreen)
                } label: {
                    Text("Done")
                        .padding(.vertical)
                        .padding(.horizontal)
                }
                .disabled(cardDescription.isEmpty || cardColor == .white) // Disable if no description or color
            }

            HStack {
                Text("New Card")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical, 1)
                    .padding(.horizontal)
                Spacer()
            }

            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(cardColor)
                    .frame(width: 300, height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                VStack {
                    
                    ZStack(alignment: .center){
                        TextField("Enter Emojis", text: $emojiInput)
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 50) // Set a fixed height for the emoji input
                            .padding(5)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(5)
                            .shadow(radius: 1)
                            .font(.system(size: 16)) // Customize font size
                            .disableAutocorrection(true) // Prevent autocorrection for emojis
                            .keyboardType(.default) // Restrict to ASCII (for emojis)
//                        // TextEditor for emojis
//                        TextEditor(text: $emojiInput)
//                            .multilineTextAlignment(.center)
//                            .frame(width: 150,height: 50) // Set a fixed height for the emoji input
//                            .padding(5)
//                            .background(Color.white)
//                            .cornerRadius(5)
//                            .shadow(radius: 1)
//                            .font(.system(size: 16)) // Customize font size
//                            .lineLimit(2) // Keep it to one line for emojis
//                            .disableAutocorrection(true) // Prevent autocorrection for emojis
//                        if emojiInput.isEmpty {
//                            Text("Enter Emojis")
//                                .foregroundColor(Color.gray)
//                        }
                    }
                    
                    ZStack(alignment: .center){
                        // TextEditor for card description
                        TextEditor(text: $cardDescription)
                            .multilineTextAlignment(.center)
                            .scrollContentBackground(.hidden)
                            .frame(width: 260,height: 90) // Set a larger height for the description
                            .padding(5)
                            .background(Color.white.opacity(0.8)).cornerRadius(5)
                            .shadow(radius: 1)
                            .font(.system(size: 16)) // Customize font size
                            .lineLimit(4) // Allow up to 4 lines
                        if cardDescription.isEmpty {
                            Text("Enter Card Description")
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                    }
                    
                }
                .padding()
            }
            .padding()

            // Color selection buttons
            VStack {
                HStack(spacing: 10) {
                    ForEach(0..<5) { index in
                        Button {
                            cardColor = cardColorArray[index]
                        } label: {
                            Circle()
                                .fill(cardColorArray[index])
                                .frame(width: 60, height: 60)
                        }
                    }
                }
                HStack(spacing: 10) {
                    ForEach(5..<10) { index in
                        Button {
                            cardColor = cardColorArray[index]
                        } label: {
                            Circle()
                                .fill(cardColorArray[index])
                                .frame(width: 60, height: 60)
                        }
                    }
                }
            }
            .padding()

            Spacer()
        }
    }
}

#Preview {
    AddCardScreen3()
        .environmentObject(CardStore3()) // Ensure that you provide the environment object
}
