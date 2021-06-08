//
//  IngredientDetailsRouter.swift
//  Nutrition Analysis
//
//  Created by Michael Maher on 07.06.21.
//

import UIKit

class IngredientDetailsRouter {
    
    class func createIngredientDetailsVC(ingredients: IngredientModel, totalIngredientDetails: [String: Fact]) -> UIViewController {
        let ingredientDetailsVC = homeStoryboard.instantiateViewController(withIdentifier: "IngredientDetailsViewController")
        guard let view = ingredientDetailsVC as? IngredientDetailsViewController else { return UIViewController() }
        view.viewModel = IngredientDetailsViewModel(ingredient: ingredients, totalIngredientDetails: totalIngredientDetails)
        view.modalPresentationStyle = .fullScreen
        return view
    }
    
    class var homeStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
