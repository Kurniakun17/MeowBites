//
//  OnboardingViewModel.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import Foundation
import SwiftData

class OnboardingViewModel: ObservableObject {
    func addBMR(context: ModelContext, BMRData: BMRData) {
        context.insert(BMRData)
    }

    func calculateBMR(userPersonalData: UserPersonalData) -> BMRData {
        var BMR: Double
        var BMRCalculation = BMRData(calorie: 0, sugar: 0, salt: 0, fat: 0)

        let weightFactorMale = 13.4 * Double(userPersonalData.weight)
        let heightFactorMale = 4.8 * Double(userPersonalData.height)
        let ageFactorMale = 5.68 * Double(userPersonalData.age)

        let weightFactorFemale = 9.25 * Double(userPersonalData.weight)
        let heightFactorFemale = 3.10 * Double(userPersonalData.height)
        let ageFactorFemale = 4.33 * Double(userPersonalData.age)

        if userPersonalData.gender == "male" {
            BMR = 88.4 + weightFactorMale + heightFactorMale - ageFactorMale
        } else {
            BMR = 447.6 + weightFactorFemale + heightFactorFemale - ageFactorFemale
        }

        switch userPersonalData.exerciseRate {
        case "no":
            BMRCalculation.calorie = BMR * 1.2

        case "light":
            BMRCalculation.calorie = BMR * 1.375

        case "moderate":
            BMRCalculation.calorie = BMR * 1.55

        case "intense":
            BMRCalculation.calorie = BMR * 1.725

        case "veryIntense":
            BMRCalculation.calorie = BMR * 1.9

        case "extraIntense":
            BMRCalculation.calorie = BMR * 2.1
        default:
            BMRCalculation.calorie = BMR
        }

        BMRCalculation.fat = (BMRCalculation.calorie / 9) * 0.3
        BMRCalculation.sugar = (BMRCalculation.calorie / 4) * 0.3
        BMRCalculation.salt = 5.0

        return BMRCalculation
    }
}
