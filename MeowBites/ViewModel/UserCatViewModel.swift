//
//  UserCatViewModel.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 27/06/24.
//
import Foundation
import SwiftData

class UserCatViewModel: ObservableObject {
    func addCatName(context: ModelContext, catName: UserCat) {
        context.insert(catName)
    }
}
