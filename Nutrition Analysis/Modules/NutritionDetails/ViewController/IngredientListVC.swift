//
//  IngredientListVC.swift
//  Nutrition Analysis
//
//  Created by user on 07/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class IngredientListVC: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var showNutritionsButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private let cellID = "IngredientTableViewCell"
    var viewModel: IngredientListViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupView()
        viewModel.viewDidLoad()
    }
    
    func setupView() {
        setNavBarClear()
        navigationBarColor()
        removeNavBorder()
        setNavigationBarTitle(text: "Ingredient List", color: .white)
        
        showNutritionsButton.layer.cornerRadius = 8
        showNutritionsButton.backgroundColor = UIColor.init(hex: "20314D")
        
        tableView.register(UINib(nibName: cellID, bundle: .main), forCellReuseIdentifier: cellID)
    }
    
    @IBAction func onShowNutritionsButtonAction(_ sender: UIButton) {
        viewModel.navigateToIngredientDetailsVC(with: viewModel.ingredients?.first, totalIngredientDetails: viewModel.totalIngredientDetails, view: self)
    }
}

extension IngredientListVC {
    
    func bindViewModel() {
        
        viewModel.isLoading.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] (loading) in
            guard let self = self else { return }
            loading ? self.showLoadingInticator() : self.hideLoadingInticator()
        }).disposed(by: disposeBag)
        
        viewModel.errorResponse.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] (error) in
            guard let self = self else { return }
            self.showError(with: error)
        }).disposed(by: disposeBag)
        
        viewModel.dataSource
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (_) in
                guard let self = self else { return }
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    private func showError(with error: String) {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        var alert = UIAlertController()
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        alert.addAction(ok)
        keyWindow.rootViewController!.present(alert,animated: true)
    }
}

extension IngredientListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? IngredientTableViewCell else { return UITableViewCell() }
        let data = viewModel.dataSource.value[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
}

extension IngredientListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.dataSource.value[indexPath.row].getIngredient()
        viewModel.navigateToIngredientDetailsVC(with: data, totalIngredientDetails: [:], view: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
