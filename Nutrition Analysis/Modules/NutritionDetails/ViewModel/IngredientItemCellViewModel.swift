//
//  IngredientItemCellViewModel.swift
//  Nutrition Analysis
//
//  Created by Michael Maher on 07.06.21.
//

import UIKit

class IngredientItemCellViewModel {
    
    // MARK: - Properties
    private let ingredient: IngredientModel
    
    // MARK: - Initialize
    init(ingredient: IngredientModel) {
        self.ingredient = ingredient
    }
    
    // MARK: - Helpers
    func getIngredientName()-> String {
        return ingredient.ingredientEntered ?? ""
    }
    
    func getIngredientCalories() -> String {
        return ingredient.calories?.description ?? "--,--"
    }
    
    func getIngredientWeight() -> String {
        return ingredient.totalWeight?.description ?? "--,--"
    }
    
    func getIngredientDetails()-> IngredientModel {
        return ingredient
    }
    
    func showErrorMessage()-> Bool {
        return ingredient.totalWeight == nil
    }
    
    func getErrorMessage()-> String? {
        return showErrorMessage() ? "low_quality" : nil
    }

    func getIngredient() -> IngredientModel {
        return ingredient
    }
}
