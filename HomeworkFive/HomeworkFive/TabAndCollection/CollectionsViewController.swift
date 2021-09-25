//
//  CollectionsViewController.swift
//  HomeworkFive
//
//  Created by Аня on 20.09.2021.
//
import UIKit

class CollectionConttroller: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var displayItems: [BasicDisplayItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(Constants.Nib.basic, forCellReuseIdentifier: Constants.Cell.basic)
        self.tableView.register(Constants.Nib.header, forHeaderFooterViewReuseIdentifier: Constants.Cell.header)
        self.getData()
}
    
    private func getData() {
        let mockItems: [BasicDisplayItem] = [
            .init(city: "Москва", temperature: 9),
            .init(city: "Калининград", temperature: 8),
            .init(city: "Санкт Петербург", temperature: 7),
            .init(city: "Екатеринбург", temperature: 6),
                ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.displayItems = mockItems
            self.tableView.reloadData()
    }
}
}

extension CollectionConttroller: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Cell.header)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constants.Cell.basic, for: indexPath)
    }
}



extension CollectionConttroller: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? BasicTableViewCell)?.configure(with: self.displayItems[indexPath.row])
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
print(indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.displayItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
}


