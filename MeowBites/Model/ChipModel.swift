//
//  ChipModel.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/06/24.
//

import SwiftUI

struct ChipModel: Identifiable {
    var id = UUID()
    @State var isSelected: Bool
    var name: String
}
