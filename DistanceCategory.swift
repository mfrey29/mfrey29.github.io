//
//  DistanceCategory.swift
//  GuyTime
//
//  Created by Michael Frey on 6/3/25.
//

import Foundation

enum DistanceCategory: String, CaseIterable {
    case under200ft = "<200ft"
    case under1000ft = "<1000ft"
    case underHalfMile = "<.5 miles"
    case under1Mile = "<1 mile"
    case under5Miles = "<5 miles"
    case under25Miles = "<25 miles"
}
