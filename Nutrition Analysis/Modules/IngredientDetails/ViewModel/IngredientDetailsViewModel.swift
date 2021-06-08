//
//  IngredientDetailsViewModel.swift
//  Nutrition Analysis
//
//  Created by Michael Maher on 07.06.21.
//

import RxSwift

final class IngredientDetailsViewModel {
    
    // MARK: - Properties
    private let ingredientDetails: IngredientModel?
    let nameObserver = PublishSubject<String>()
    var dataSource = [IngredientFactCellviewModel]()
    let success = PublishSubject<[IngredientFactCellviewModel]>()
    var totalIngredientDetails = [String: Fact]()
    let requiredKeys = "Calories,Fat,Cholesterol,Sodium,Carbs,Protein,Vitamin,Calcium,Iron,Potassium"

    // MARK: - Initilize
    init(ingredient: IngredientModel, totalIngredientDetails: [String: Fact]) {
        self.ingredientDetails = ingredient
        self.totalIngredientDetails = totalIngredientDetails
        if self.totalIngredientDetails.count != 0 {
            self.initCellViewModels(nutrients: totalIngredientDetails)
        }else {
            self.initCellViewModels(nutrients: ingredientDetails?.totalNutrients)
        }
    }
    
    func initCellViewModels(nutrients: [String: Fact]?) {
        self.dataSource.removeAll()
        let _ = nutrients?.map{ [weak self] item in
            let newValue = item.value.label?.split(separator: " ").first?.description ?? ""
            if requiredKeys.lowercased().contains(newValue.lowercased()) {
                self?.dataSource.append(IngredientFactCellviewModel(fact: item.value))
            }
        }
        
        if self.totalIngredientDetails.count == 0 {
            let caloriesFact = Fact(label: "Calories", quantity: ingredientDetails?.calories , unit: nil)
            self.dataSource.insert(IngredientFactCellviewModel(fact: caloriesFact), at:0)
        }
    }
    
    // MARK: - ViewDidLoad
    func viewDidLoad() {
        success.onNext(dataSource)
        if totalIngredientDetails.count != 0 {
            nameObserver.onNext("Total Nutrients")
        }else {
            nameObserver.onNext(ingredientDetails?.ingredientEntered ?? "")
        }
    }
}
