//
//  IngredientNutrationFactsTableViewCell.swift
//  Nutrition Analysis
//
//  Created by Michael Maher on 07.06.21.
//

import UIKit

class IngredientNutrationFactsTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!

    func setupCell(data: IngredientFactCellviewModel) {
        valueLabel.text = data.getNutritionValue()
        nameLabel.text = data.getNutritionName()
    }
}
