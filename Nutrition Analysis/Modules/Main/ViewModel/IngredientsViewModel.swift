//
//  IngredientsViewModel.swift
//  Nutrition Analysis
//
//  Created by user on 07/06/2021.
//

import RxSwift
import RxCocoa

final class IngredientsViewModel {
    
    var ingredientTxt: BehaviorRelay<String> = BehaviorRelay(value: "")
    var isStartBtnEnalbed: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let router = IngredientRouter()
    private let disposeBag = DisposeBag()
    private var ingredients: [IngredientModel] = []
    private var ingredientValue = ""
    
    public func addNewGredient(value: String) {
        self.ingredientValue = value
        let values = value.replacingOccurrences(of: "\"", with: "").split(separator: "\n")
        let isValueValidCount = values.filter{self.isValidIngredient(value: $0.description) == true}.count
        let isValid = values.count == isValueValidCount
        if ingredientValue.isEmpty {
            self.isStartBtnEnalbed.accept(false)
        }else {
            self.isStartBtnEnalbed.accept(isValid)
        }
    }
    
    private func resetIngredients() {
        ingredients.removeAll()
    }
    
    func createIngredientsAnalysis(for view: UIViewController) {
        resetIngredients()
        
        let ingredients = ingredientValue.split(separator: "\n")
        let _ = ingredients.map { [weak self] value in
            self?.ingredients.append(IngredientModel(ingredientEntered: value.description))
        }
        self.navigateToIngredientListVC(view: view)
    }
    
    // MARK: - isValidIngredient
    private func isValidIngredient(value: String)-> Bool {
        if value.count == 0 {
            return false
        } else {
            let regex = "^[0-9]+\\s.*"
            let textTest = NSPredicate(format:"SELF MATCHES %@", regex)
            return textTest.evaluate(with: value)
        }
    }
    
    func navigateToIngredientListVC(view: UIViewController) {
        router.navigateToNutrationListVC(ingredients: ingredients, view: view)
    }
}
