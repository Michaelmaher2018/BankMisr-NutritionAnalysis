//
//  IngredientListViewModel.swift
//  Nutrition Analysis
//
//  Created by user on 07/06/2021.
//

import RxSwift
import RxCocoa

final class IngredientListViewModel {
    
    // MARK: - Properties
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var errorResponse: PublishSubject<String> = PublishSubject()
    private let interactor: IngredientInteractor!

    var dataSource: BehaviorRelay<[IngredientItemCellViewModel]> = BehaviorRelay(value: [])
    let ingredients: [IngredientModel]?
    var totalDataSource: IngredientItemCellViewModel?
    var totalIngredientDetails = [String: Fact]()
    private let router = IngredientListRouter()
    private let disposeBag = DisposeBag()

    // MARK: - Initialize
    init(ingredients: [IngredientModel], interactor: IngredientInteractor) {
        self.ingredients = ingredients
        self.interactor = interactor
        self.initIngredientsModels(ingredients:ingredients)
    }
    
    private func initIngredientsModels(ingredients: [IngredientModel]) {
        _ = ingredients.map{self.dataSource.accept(dataSource.value + [IngredientItemCellViewModel(ingredient: $0)])}
    }
    
    func navigateToIngredientDetailsVC(with data: IngredientModel?, totalIngredientDetails: [String: Fact], view: UIViewController) {
        if let data = data {
            router.navigateToIngredientDetailsVC(ingredients: data, totalIngredientDetails: totalIngredientDetails, view: view)
        }
    }
    
    func viewDidLoad() {
        self.dataSource.value.enumerated().forEach({(index,item) in
            self.getIngredientDetails(ingredientValue: item.getIngredientName(), index: index) // "1 apple,"  "1 apple"
        })
    }

    // MARK: - GetIngredientDetails
    func getIngredientDetails(ingredientValue: String, index: Int) {
        isLoading.accept(true)
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getNutritionDetails(value: ingredientValue) { [weak self] (data, error) in
                DispatchQueue.main.async {
                guard let self = self else { return }
                    self.isLoading.accept(false)
                    if let error = error {
                        self.errorResponse.onNext(error.localizedDescription)
                        return
                    }
                    
                    if let ingredient = data {
                        self.addIngrToTotal(with: ingredient)
                        ingredient.ingredientEntered = ingredientValue
                        var newDataSource = self.dataSource.value
                        newDataSource[index] = IngredientItemCellViewModel(ingredient: ingredient)
                        self.dataSource.accept(newDataSource)
                    }
                }
            }
        }
    }

    func addIngrToTotal(with data: IngredientModel) {
        guard let newNutrients = data.totalNutrients else { return }
        for (key, value) in newNutrients {
            let currentValue = totalIngredientDetails[key]?.quantity ?? 0.0
            let newValue = currentValue + (value.quantity ?? 0.0)
            let totalFact = Fact(label: value.label, quantity: newValue, unit: value.unit)
                totalIngredientDetails.updateValue(totalFact, forKey: key)
        }
        
        let currentCal = totalIngredientDetails["Calories"]?.quantity ?? 0.0
        let newCal = currentCal + (data.calories ?? 0.0)
        let calFact = Fact(label: "Calories", quantity: newCal, unit: .kcal)
        totalIngredientDetails.updateValue(calFact, forKey: "Calories")
    }
}
