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
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        self.navigationController?.navigationBar.barTintColor = Theme.color.goBlue()
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        


        // Do any additional setup after loading the view.
        tableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
        view.addSubview(tableView)
        setupAutoLayout()
        leftBarButton()
    }
    
    func leftBarButton(){
        let icon = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(MessagesViewController.iconClick))
        icon.tintColor = .white
        self.navigationItem.rightBarButtonItem = icon
    }
    
    @objc func iconClick(){
        print("click")
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
    
    /*func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
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
    }*/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0: return nil
        case 1: return "GoMore Points"
        case 2: return "Ridesharing"
        case 3: return "Rental"
        case 4: return "Payment"
        case 5: return "Other"
        default: fatalError("Unknown section")
        }
    }
    
    //
    // MARK :- CELL
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 1
        case 1: return 2
        case 2: return 1
        case 3: return 2
        case 4: return 3
        case 5: return 4
        default: fatalError("Unknown number of sections")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch(indexPath.section) {
        case 0: return 60
        case 1: return 50
        case 2: return 50
        case 3: return 50
        case 4: return 50
        case 5: return 50
        default: fatalError("Unknown height of sections")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableCell
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0:
                cell.titleText.text = "Username"
                return cell
            default: fatalError("Unknown row in section 0")
            }
        case 1:
            switch(indexPath.row) {
            case 0:
                cell.titleText.text = "Points overview"
                return cell
            case 1:
                cell.titleText.text = "Earn free rentals"
                return cell
            default: fatalError("Unknown row in section 1")
            }
        case 2:
            switch(indexPath.row) {
            case 0:
                cell.titleText.text = "Ride alerts"
                return cell
            default: fatalError("Unknown row in section 1")
            }
        case 3:
            switch(indexPath.row) {
            case 0:
                cell.titleText.text = "My cars"
                return cell
            case 1:
                cell.titleText.text = "Favorite cars"
                return cell
            default: fatalError("Unknown row in section 1")
            }
        case 4:
            switch(indexPath.row) {
            case 0:
                cell.titleText.text = "Payment cards"
                return cell
            case 1:
                cell.titleText.text = "Balance"
                return cell
            case 2:
                cell.titleText.text = "Transfers"
                return cell
            default: fatalError("Unknown row in section 1")
            }
        case 5:
            switch(indexPath.row) {
            case 0:
                cell.titleText.text = "Support"
                return cell
            case 1:
                cell.titleText.text = "Contact us"
                return cell
            case 2:
                cell.titleText.text = "Recommend in App Store"
                return cell
            case 3:
                cell.titleText.text = "Log out"
                return cell
            default: fatalError("Unknown row in section 1")
            }
        default: fatalError("Unknown section")
        }
        cell.leftImageView.image =  UIImage(named: "user")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        self.accessoryType = .disclosureIndicator
        setupView()
    }
    
    let leftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.backgroundColor = UIColor.gray
        return image
    }()
    
    
    let titleText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    func  setupView(){
        addSubview(leftImageView)
        addSubview(titleText)

        
        leftImageView.snp.remakeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        titleText.snp.remakeConstraints { (make) in
            make.left.equalTo(leftImageView.snp.right).offset(20)
            make.centerY.equalTo(self.snp.centerY)

        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
