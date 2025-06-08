//
//  ProfileCard.swift
//  GuyTime
//
//  Created by Michael Frey on 6/3/25.
//

import SwiftUI

struct ProfileCard: View {
    @Binding var profile: Profile
    @State private var isPressed = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottomLeading) {
                (Image(uiImage: UIImage(named: profile.imageName) ?? UIImage(systemName: "person.fill")!))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .cornerRadius(3)

                VStack(alignment: .leading, spacing: 2) {
                    Text("\(profile.name.uppercased()), \(profile.age)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 2)

                    Text(profile.distance)
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.8))
                        .shadow(radius: 1)
                }
                .padding(6)
            }

            if profile.isLiked {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .padding(6)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .padding(4)
            }
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(3)
        .onTapGesture {
            profile.isLiked.toggle()
        }
        .onLongPressGesture(minimumDuration: 0.2, pressing: { isPressing in
            withAnimation {
                isPressed = isPressing
            }
        }, perform: {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        })
    }
}
