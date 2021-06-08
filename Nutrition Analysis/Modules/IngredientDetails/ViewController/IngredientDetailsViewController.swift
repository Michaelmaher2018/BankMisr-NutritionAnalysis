//
//  IngredientDetailsViewController.swift
//  Nutrition Analysis
//
//  Created by Michael Maher on 07.06.21.
//

import UIKit
import RxSwift
import RxCocoa

class IngredientDetailsViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private let cellID = "IngredientNutrationFactsTableViewCell"
    var viewModel: IngredientDetailsViewModel!
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
        setNavigationBarTitle(text: "Ingredient Details", color: .white)
        tableView.register(UINib(nibName: cellID, bundle: .main), forCellReuseIdentifier: cellID)
    }
}

extension IngredientDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? IngredientNutrationFactsTableViewCell else { return UITableViewCell() }
        let data = viewModel.dataSource[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
}

extension IngredientDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension IngredientDetailsViewController {

    func bindViewModel() {
        viewModel.success
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (data) in
                guard let self = self else { return }
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel.nameObserver.bind(to:titleLabel.rx.text).disposed(by: disposeBag)
    }
}
