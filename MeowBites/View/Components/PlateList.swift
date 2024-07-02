//
//  PlateList.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 28/06/24.
//

import SwiftData
import SwiftUI

struct PlateList: View {
    @Query var intakeLogs: [IntakeLog]
    @Query(sort: [SortDescriptor(\Plate.food.calorie)]) var plates: [Plate]

    var body: some View {
        VStack(spacing: 10) {
            ForEach(intakeLogs.last!.plates) { plate in
                PlateCardView(
                    food: plate.food
                )
            }
        }
    }

    init(sort: SortDescriptor<Plate>) {
        _plates = Query(sort: [sort])
    }
}

#Preview {
    PlateList(sort: SortDescriptor(\Plate.food.calorie))
}
