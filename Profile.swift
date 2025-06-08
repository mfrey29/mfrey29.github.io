//
//  Profile.swift
//  GuyTime
//
//  Created by Michael Frey on 6/3/25.
//

import Foundation

struct Profile: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let age: Int
    let imageName: String
    let distance: String
    let distanceCategory: DistanceCategory
    var isLiked: Bool = false
}

let sampleProfiles: [Profile] = [
    Profile(name: "Alex", age: 28, imageName: "person1", distance: "120 ft", distanceCategory: .under200ft),
    Profile(name: "Jamie", age: 26, imageName: "person2", distance: "190 ft", distanceCategory: .under200ft),
    Profile(name: "Morgan", age: 29, imageName: "person3", distance: "450 ft", distanceCategory: .under1000ft),
    Profile(name: "Logan", age: 30, imageName: "person4", distance: "980 ft", distanceCategory: .under1000ft),
    Profile(name: "Chris", age: 30, imageName: "person5", distance: "0.3 mi", distanceCategory: .underHalfMile),
    Profile(name: "William", age: 34, imageName: "person6", distance: "0.4 mi", distanceCategory: .underHalfMile),
    Profile(name: "Taylor", age: 24, imageName: "person7", distance: "0.7 mi", distanceCategory: .under1Mile),
    Profile(name: "James", age: 33, imageName: "person8", distance: "0.9 mi", distanceCategory: .under1Mile),
    Profile(name: "Jordan", age: 32, imageName: "person9", distance: "2 mi", distanceCategory: .under5Miles),
    Profile(name: "Benjamin", age: 28, imageName: "person10", distance: "3.2 mi", distanceCategory: .under5Miles),
    Profile(name: "Henry", age: 25, imageName: "person11", distance: "4.7 mi", distanceCategory: .under5Miles),
    Profile(name: "Liam", age: 27, imageName: "person12", distance: "6 mi", distanceCategory: .under25Miles),
    Profile(name: "Ethan", age: 22, imageName: "person13", distance: "10 mi", distanceCategory: .under25Miles),
    Profile(name: "Elijah", age: 29, imageName: "person14", distance: "12 mi", distanceCategory: .under25Miles),
    Profile(name: "Lucas", age: 35, imageName: "person15", distance: "14.8 mi", distanceCategory: .under25Miles),
    Profile(name: "Mason", age: 26, imageName: "person16", distance: "17.4 mi", distanceCategory: .under25Miles),
    Profile(name: "Noah", age: 31, imageName: "person17", distance: "22.5 mi", distanceCategory: .under25Miles),
    Profile(name: "Daniel", age: 27, imageName: "person18", distance: "24.9 mi", distanceCategory: .under25Miles)
]
