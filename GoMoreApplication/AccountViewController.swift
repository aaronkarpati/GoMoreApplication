//
//  AccountViewController.swift
//  GoMoreApplication
//
//  Created by Áron Kárpáti on 2019. 02. 02..
//  Copyright © 2019. Áron Kárpáti. All rights reserved.
//

import UIKit
import SnapKit

class AccountViewController: UIViewController {
    
    private let headerId = "headerId"
    private let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = Theme.color.goGrey()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CustomTableViewHeader.self, forHeaderFooterViewReuseIdentifier: self.headerId)
        tableview.register(CustomTableCell.self, forCellReuseIdentifier: self.cellId)
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Account"
        view.backgroundColor = Theme.color.goGrey()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        self.navigationController?.navigationBar.barTintColor = Theme.color.goBlue()

        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        setupAutoLayout()
    }
    
    func setupAutoLayout() {
        
        tableView.snp.remakeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource{
    
    //
    // MARK :- HEADER
    //
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! CustomTableViewHeader
        switch(section) {
        case 0: return nil
        case 1: return header
        case 2: return header
        case 3: return header
        case 4: return header
        case 5: return header
        default: fatalError("Unknown number of sections")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //
    // MARK :- CELL
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 1    // section 0 has 1 rows
        case 1: return 2    // section 1 has 2 row
        case 2: return 1    // section 2 has 1 rows
        case 3: return 2    // section 3 has 2 row
        case 4: return 3    // section 4 has 3 rows
        case 5: return 4    // section 5 has 3 rows
        default: fatalError("Unknown number of sections")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableCell
        return cell
    }

    
    
}

//
// MARK :- HEADER
//
class CustomTableViewHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
// MARK :- CELL
//
class CustomTableCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
