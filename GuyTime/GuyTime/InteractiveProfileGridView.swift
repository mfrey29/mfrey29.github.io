//
//  InteractiveProfileGridView.swift
//  GuyTime
//
//  Created by Michael Frey on 6/3/25.
//

import SwiftUI

struct InteractiveProfileGridView: View {
    @State private var profiles: [Profile] = sampleProfiles
    @State private var draggedProfileId: UUID?
    @State private var isHoveringTrash = false
    @State private var showSideBin = false
    @State private var hideWorkItem: DispatchWorkItem?

    // Spacing between cards (internal only)
    let cardSpacing: CGFloat = 6
    let columns = Array(repeating: GridItem(.flexible(), spacing: 6), count: 3)

    // Only subtract the spacing between cards, not at the edges
    var cardWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let totalSpacing: CGFloat = cardSpacing * 2 // Only 2 gaps between 3 columns
        return (screenWidth - totalSpacing) / 3
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color("Default")
                        .ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView {
                    ForEach(DistanceCategory.allCases, id: \.self) { category in
                        let filtered = profiles.filter { $0.distanceCategory == category }
                        if !filtered.isEmpty {
                            // Category Header
                            Text(category.rawValue)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color("DistanceText"))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 1)
                                .background(Color("DistanceBanner"))
                                

                            // FLUSH grid, no horizontal padding
                            LazyVGrid(columns: columns, spacing: cardSpacing) {
                                ForEach(filtered) { profile in
                                    ProfileCard(profile: binding(for: profile))
                                        .frame(width: cardWidth, height: cardWidth)
                                        .onDrag {
                                            draggedProfileId = profile.id
                                            return NSItemProvider(object: NSString(string: profile.id.uuidString))
                                        }
                                }
                            }
                            .padding(.top, cardSpacing)
                            .padding(.bottom, 17)
                        }
                    }
                    
                }
                .gesture(DragGesture().onChanged { _ in
                    handleScroll()
                })
                

            }
            
            // Floating Green Side Bin (Trash) Button
            if showSideBin {
                SideBinButton(isHovering: isHoveringTrash)
                    .onDrop(of: [.text], isTargeted: $isHoveringTrash) { providers in
                        _ = providers.first?.loadObject(ofClass: NSString.self) { object, _ in
                            if let idString = object as? String,
                               let uuid = UUID(uuidString: idString) {
                                DispatchQueue.main.async {
                                    profiles.removeAll { $0.id == uuid }
                                }
                            }
                        }
                        return true
                    }
                    .transition(.opacity)
            }
        }
     
    }

    private func binding(for profile: Profile) -> Binding<Profile> {
        guard let index = profiles.firstIndex(where: { $0.id == profile.id }) else {
            fatalError("Profile not found")
        }
        return $profiles[index]
    }

    private func handleScroll() {
        if !showSideBin {
            withAnimation {
                showSideBin = true
            }
        }
        hideWorkItem?.cancel()
        let task = DispatchWorkItem {
            withAnimation {
                showSideBin = false
            }
        }
        hideWorkItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: task)
    }
}



