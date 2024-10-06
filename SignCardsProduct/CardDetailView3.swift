//
//  CardDetailView3.swift
//  SignCardsProduct
//
//  Created by Sumayah Alqahtani on 03/04/1446 AH.
//

import SwiftUI

struct CardDetailView3: View {
    var card3: Card3

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(card3.color)
                    .frame(width: 300, height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                Text(card3.description)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(width: 280)
                    .frame(maxHeight: .infinity, alignment: .center)
            }
            .padding()

            Spacer()
        }
    }
}
