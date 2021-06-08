//
//  IngredientListRouter.swift
//  Nutrition Analysis
//
//  Created by user on 07/06/2021.
//

import UIKit

class IngredientListRouter {
    class func createIngredientListVC(ingredients: [IngredientModel]) -> UIViewController {
        let ingredientListVC = homeStoryboard.instantiateViewController(withIdentifier: "IngredientListVC")
        let _ = CNavigation(rootViewController: ingredientListVC)

        let interactor = IngredientInteractor()
        if let view = ingredientListVC as? IngredientListVC {
            view.viewModel = IngredientListViewModel(ingredients: ingredients, interactor: interactor)
        }
        ingredientListVC.modalPresentationStyle = .fullScreen
        return ingredientListVC
    }
    
    func navigateToIngredientDetailsVC(ingredients: IngredientModel, totalIngredientDetails: [String: Fact], view: UIViewController?) {
        let ingredientDetailsView = IngredientDetailsRouter.createIngredientDetailsVC(ingredients: ingredients, totalIngredientDetails: totalIngredientDetails)
        if let viewController = view {
            viewController.navigationController?.pushViewController(ingredientDetailsView, animated: true)
        }
    }
    
    class var homeStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}

public class CNavigation: UINavigationController {
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.visibleViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        super.pushViewController(viewController, animated: animated)
    }
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
