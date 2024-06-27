//
//  UserCatModel.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 27/06/24.
//

import SwiftUI

import SwiftData

@Model
class UserCat: Identifiable {
    var name: String

    init(name: String) {
        self.name = name
    }
}
