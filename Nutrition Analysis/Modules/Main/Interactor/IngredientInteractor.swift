//
//  GetIngredientAPI.swift
//  NutritionAnalysis
//
//  Created by MacBook Pro on 05/06/2021.
//

import Foundation

class IngredientInteractor: NSObject {
    
    //MARK: - getNutritionDetails
    func getNutritionDetails(value: String, completionHandler: @escaping(IngredientModel?, Error?) -> ())  {
        APIClient.getNutritionDetails(decodedType: IngredientModel.self, value: value) { (response: IngredientModel?, error: Error?) in
            if let response = response {
                completionHandler(response, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
}
