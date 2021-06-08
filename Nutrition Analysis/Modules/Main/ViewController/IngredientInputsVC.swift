//
//  ViewController.swift
//  Nutrition Analysis
//
//  Created by user on 07/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class IngredientInputsVC: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var exampleLabel: UILabel!
    @IBOutlet private weak var ingredientsTextView: UITextView!
    @IBOutlet private weak var startButton: UIButton!
    
    // MARK: - Properties
    private var viewModel = IngredientsViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }
    
    private func setupView() {
        setNavBarClear()
        navigationBarColor()
        removeNavBorder()
        setNavigationBarTitle(text: "Ingredient Inputs", color: .white)
        
        ingredientsTextView.layer.cornerRadius = 8
        ingredientsTextView.layer.borderWidth = 0.5
        ingredientsTextView.layer.borderColor = UIColor.gray.cgColor
        
        startButton.layer.cornerRadius = 8
        startButton.backgroundColor = UIColor.init(hex: "20314D")
        startButton.alpha = 0.3
        startButton.isEnabled = false
        exampleLabel.text = "Please type your ingredients here.\nex. 1 large apple"
        
    }
    
    @IBAction private func onStartButtonAction(_ sender: Any) {
        viewModel.createIngredientsAnalysis(for: self)
    }
    
}

extension IngredientInputsVC {
    
    func bindViewModel() {
        
        ingredientsTextView.rx.text.orEmpty.asObservable()
            .bind(to: viewModel.ingredientTxt)
            .disposed(by: disposeBag)
        
        viewModel.isStartBtnEnalbed.subscribe(onNext: {[weak self] (isEnabled) in
            self?.startButton.alpha = isEnabled ? 1 : 0.3
            self?.startButton.isEnabled = isEnabled
        }).disposed(by: disposeBag)
                
        ingredientsTextView.rx.text.bind(onNext: {[weak self] value in
            self?.viewModel.addNewGredient(value: value ?? "")
        }).disposed(by: disposeBag)
        
    }
}
