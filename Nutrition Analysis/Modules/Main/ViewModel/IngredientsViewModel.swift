//
//  IngredientsViewModel.swift
//  Nutrition Analysis
//
//  Created by user on 07/06/2021.
//

import RxSwift
import RxCocoa

class IngredientsViewModel {

    var ingredientTxt: BehaviorRelay<String> = BehaviorRelay(value: "")
    var isAnalysisBtnEnalbed: PublishSubject<Bool> = PublishSubject()
    var pushToView = PublishSubject<Void>()

    private let router = IngredientRouter()
    private let disposeBag = DisposeBag()
    
    var getIngredientResponse: BehaviorRelay<IngredientModel?> = BehaviorRelay(value: nil)
    var getIngredientErrorResponse: BehaviorRelay<String?> = BehaviorRelay(value: nil)

    var ingredients: [IngredientModel] = []
    private var ingredientValue = ""

    init() {
        startObserver()
    }
    
    private func startObserver() {
        ingredientTxt.asObservable().subscribe(onNext: { [weak self] ingredient in
            guard let self = self else { return }
            var areInputsValid = true
            if ingredient.isEmpty {
                areInputsValid = false
            }
            self.isAnalysisBtnEnalbed.onNext(areInputsValid)
        }).disposed(by: disposeBag)
    }

    public func addNewGredient(value: String) {
        self.ingredientValue = value
        let values = value.replacingOccurrences(of: "\"", with: "").split(separator: "\n")
        let isValueValidCount = values.filter{self.isValidGredient(value: $0.description) == true}.count
        let isValid = values.count == isValueValidCount
        isAnalysisBtnEnalbed.onNext(isValid)
    }

    private func resetIngredients() {
        ingredients.removeAll()
    }

    func createIngredientsAnalysis(for view: UIViewController) {
        resetIngredients()

        let ingredients = ingredientValue.split(separator: "\n")
        let _ = ingredients.map{[weak self] value in
            self?.ingredients.append(IngredientModel(ingredientEntered: value.description))
        }
        self.navigateToIngredientListVC(view: view)
    }

    // MARK: - IsValidGredient
    private func isValidGredient(value: String)-> Bool {
        let regex = "^[0-9]+\\s.*"
        let textTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return textTest.evaluate(with: value)
    }
    
    func navigateToIngredientListVC(view: UIViewController) {
        router.navigateToNutrationListVC(ingredients: ingredients, view: view)
    }


}

