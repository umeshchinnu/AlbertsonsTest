//
//  ViewController.swift
//  Test
//
//  Created by UMESH MADATHA on 06/09/22.
//

import UIKit

class ViewController: UIViewController {

    lazy var viewModel: HomeViewModel = HomeViewModel()
    var data: [LF]?
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.text = "MM"
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        if let text = searchField.text, text.count > 0 {
            viewModel.callSearchAPI(searchText: text, completionHandler: { result in
                if let data = result?.first {
                    self.data = data.lfs
                }
                self.reloadTableView()
            })
        } else {
            self.data?.removeAll()
            reloadTableView()
        }
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDataSource - UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        let lf = self.data?[indexPath.row]
        cell.configureCell(text: lf?.lf ?? "")
        return cell
    }
}
