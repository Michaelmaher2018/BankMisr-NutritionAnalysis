//
//  IngredientRouter.swift
//  NutritionAnalysis


import UIKit

class IngredientRouter {
    
    func navigateToNutrationListVC(ingredients: [IngredientModel], view: UIViewController?) {
        let ingredientListView = IngredientListRouter.createIngredientListVC(ingredients: ingredients)
        if let viewController = view {
            viewController.navigationController?.pushViewController(ingredientListView, animated: true)
        }
    }
    
    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
