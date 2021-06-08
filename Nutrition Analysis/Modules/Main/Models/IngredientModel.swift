//
//  IngredientModel.swift
//  NutritionAnalysis
//

import UIKit

class IngredientModel: Codable {
    
    var ingredientEntered: String? = nil
    var uri: String? = nil
    var yield: Double? = nil
    var calories: Double? = nil
    var totalWeight: Double? = nil
    var totalNutrients: [String: Fact]? = nil
    var totalDaily: [String: Fact]? = nil
    var errorMessage: String?
    
    init(ingredientEntered: String) {
        self.ingredientEntered = ingredientEntered
        self.totalWeight = 0.00
    }
}

// MARK: - Fact
struct Fact: Codable {
    let label: String?
    let quantity: Double?
    let unit: Unit?
}

// MARK: - Unit
enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}
