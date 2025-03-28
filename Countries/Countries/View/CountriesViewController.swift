//
//  CountriesViewController.swift
//  Countries
//
//  Created by Shailesh Srigiri on 3/27/25.
//

import UIKit

class CountriesViewController: UIViewController {

    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    private let viewModel: CountriesViewModel

    init(viewModel: CountriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        view.backgroundColor = .systemBackground
        setupTableView()
        setupSearchController()
        setupBindings()
        
        Task {
            await viewModel.fetchCountries()
        }
        
        
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    private func setupTableView() {
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Name or Capital"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func setupBindings() {
        viewModel.onDataUpdated = { [weak self] in
            self?.tableView.reloadData()
        }

        viewModel.onError = { [weak self] errorMessage in
            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
}

extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredCountries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        let country = viewModel.filteredCountries[indexPath.row]
        cell.configure(with: country)
        return cell
    }
}

extension CountriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filter(with: searchController.searchBar.text ?? "")
    }
}
