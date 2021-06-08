//
//  IngredientTableViewCell.swift
//  Nutrition Analysis
//
//  Created by Michael Maher on 07.06.21.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var caloriesLabel: UILabel!
    @IBOutlet private weak var errorMessageLabel: UILabel!

    override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
         containerView.layer.cornerRadius = 8
         containerView.layer.borderWidth = 0.5
         containerView.layer.borderColor = UIColor.init(hex: "000000").withAlphaComponent(0.16).cgColor
     }

    // MARK: - setup Cell
    func setupCell(data: IngredientItemCellViewModel) {
        print("data---->", data.getIngredientWeight(), "|" ,data.getIngredientCalories())
        nameLabel.text = data.getIngredientName()
        weightLabel.text = data.getIngredientWeight()
        caloriesLabel.text = data.getIngredientCalories()
        handleError(with: data.getErrorMessage() ?? "")
    }

    private func handleError(with error: String) {
        errorMessageLabel.text = "Error Msg: " + error
        errorMessageLabel.isHidden = error.isEmpty
    }
}
