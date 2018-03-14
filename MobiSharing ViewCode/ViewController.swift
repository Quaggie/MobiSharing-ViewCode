//
//  ViewController.swift
//  MobiSharing ViewCode
//
//  Created by Jonathan Bijos on 14/03/18.
//  Copyright © 2018 DevsCarioca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let motorcycles: [Motorcycle]
    
    private lazy var tableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(MotorcycleTableViewCell.self, forCellReuseIdentifier: MotorcycleTableViewCell.identifier)
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()
    
    init() {
        motorcycles = [
            Motorcycle(image: #imageLiteral(resourceName: "hayabusa"), name: "Suzuki Hayabusa", type: .sport),
            Motorcycle(image: #imageLiteral(resourceName: "tiger"), name: "Triumph Tiger 1200 XC", type: .bigTrail),
            Motorcycle(image: #imageLiteral(resourceName: "streetbob"), name: "Harley Davidson Street Bob", type: .custom)
        ]
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Motorcycles"
        
        view.addSubview(tableview)
        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MotorcycleTableViewCell.height
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return motorcycles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let motorcycle = motorcycles[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: MotorcycleTableViewCell.identifier, for: indexPath) as! MotorcycleTableViewCell
        cell.motorcycle = motorcycle
        return cell
    }
}