//
//  CountryCodeListViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 26.11.2021.
//

import UIKit

class CountryCodeListViewController: UIViewController, Storyboarded {
    var viewModel: CountryCodeListViewModel?
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Check For Is Filtering
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    // MARK: - Search Bar Filtering is active?
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel?.getTitle()
        
        viewModel?.load()
        
        self.setupTableView()
        
        self.setupSearchBar()
    }
    
    // MARK: - Setup Table View and register resusable cell
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
     
        tableView.register(UINib(nibName: "CountryCodeTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryCodeTableViewCell")
        tableView.reloadData()
    }

    // MARK: - Setup Search Bar
    public func setupSearchBar() {
        searchController.searchResultsUpdater = self
        
        searchController.searchBar.placeholder = "Search Countries"
        
        navigationItem.searchController = searchController
    }
}

extension CountryCodeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return viewModel?.filteredCountries?.count ?? 0
        }
        
        return viewModel?.countries?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCodeTableViewCell.identifier, for: indexPath)
        as! CountryCodeTableViewCell
 
        if isFiltering {
            cell.setUpView(with: (viewModel?.filteredCountries![indexPath.row])!)
        } else {
            cell.setUpView(with: (viewModel?.countries![indexPath.row])!)
        }
        
        return cell
    }
    
    // MARK: - Set tableView row heigth to fit for country images
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

// MARK: Extensions for Searchbar
extension CountryCodeListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel?.filter(searchText: searchBar.text!)
        tableView.reloadData()
    }
}
