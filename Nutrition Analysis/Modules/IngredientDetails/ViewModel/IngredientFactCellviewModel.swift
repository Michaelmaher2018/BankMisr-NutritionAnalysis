//
//  IngredientFactCellviewModel.swift
//  Nutrition Analysis
//
//  Created by Michael Maher on 07.06.21.
//

import UIKit

class IngredientFactCellviewModel {
    
    // MARK: - Properties
    private let fact: Fact
    
    // MARK: - Initilaize
    init(fact: Fact) {
        self.fact = fact
    }
    
    // MARK: - Helpers
    func getNutritionName()-> String {
        return fact.label ?? ""
    }
    
    func getNutritionValue()-> String {
        let value = fact.quantity ?? 0.00
        return String(format: "%.2f", value)
    }
}
