//
//  ViewController.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/19/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum ChartSections: Int {
        case chartSection
        case subscriptionSection
    }
    
    let cellId = "cellId"
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    let subscriptionHeader = SubscriptionHeader()
    let chartViewHeader = ChartView()
    
    var subscriptions = [Subscription(name: "Netflix", price: 12.99, image: "NetflixLogo"), Subscription(name: "Spotify", price: 9.99, image: "SpotifyLogo"), Subscription(name: "Disney Plus", price: 6.99, image: "DisneyPlusLogo")]
    lazy var total = subscriptions.map({$0.price}).reduce(0, +)
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavBar()
        setupSearchBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chartViewHeader.chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
        total = subscriptions.map({$0.price}).reduce(0, +)
        subscriptionHeader.totalCostLabel.text = "$\(total.rounded()) / Month"
    }
    
    //MARK: - Sets up Navigation Bar
    fileprivate func setupNavBar() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .systemBlue
       
        let navigationTitleView = NavigationTitleView()
        navigationTitleView.frame.size = CGSize(width: 120, height: 40)
        navigationItem.titleView = navigationTitleView

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushSubscriptionController))
        navigationItem.searchController = searchController
        
    }
    
    //MARK: - Sets Up SearchBar
    fileprivate func setupSearchBar () {
        let searchBar = searchController.searchBar
        searchBar.placeholder = "Goals"
    }
    
    //MARK: - Sets Up TableView
    fileprivate func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SubscriptionCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.tableFooterView = UIView()
    }
    
    //MARK: - Fileprivate Functions
    @objc fileprivate func pushSubscriptionController() {
        print("Pushing to SubscriptionController")
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addSubscriptionController = storyBoard.instantiateViewController(identifier: "AddSubscriptionController") as! AddSubscriptionController
        addSubscriptionController.delegate = self
        navigationController?.pushViewController(addSubscriptionController, animated: true)
    }
    
    //MARK: - TableView Delegates & Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch ChartSections(rawValue: section) {
        case .chartSection: return chartViewHeader
        case .subscriptionSection: return subscriptionHeader
        default: return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SubscriptionCell
        cell.subscription = subscriptions[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ChartSections(rawValue: section) {
        case .chartSection: return 0
        default: return subscriptions.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch ChartSections(rawValue: section) {
        case .chartSection: return 330
        case .subscriptionSection: return 50
        default: return 0
        }
    }
    
    //Remove Cells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            subscriptions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK: - AddSubscription Delegates
extension ViewController: AddSubscriptionControllerDelegate {
    func addSubscription(subscription: Subscription) {
        subscriptions.append(subscription)
        let indexPath = IndexPath(row: subscriptions.count - 1, section: 1)
    
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
    }
}
