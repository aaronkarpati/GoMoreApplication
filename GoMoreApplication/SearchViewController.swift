//
//  SearchViewController.swift
//  GoMoreApplication
//
//  Created by Áron Kárpáti on 2019. 02. 02..
//  Copyright © 2019. Áron Kárpáti. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    var searchRides = UIView() //SearchRides(frame: view.bounds)
    var searchRentals = UIView() //SearchRentals(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Theme.color.goGrey()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = Theme.color.goBlue()
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]

        // Do any additional setup after loading the view.
        addSegment()
    }
    
    func addSegment()  {
        let items = ["Rides", "Rentals"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: 0, y: 0, width: 320, height: 40)
        segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 1
        self.navigationController?.navigationBar.addSubview(segmentedControl)
        
        searchRides = SearchRides(frame: view.bounds)
        searchRentals = SearchRentals(frame: view.bounds)
        self.view.addSubview(searchRides)
        self.view.addSubview(searchRentals)
        
        
        segmentedControl.snp.remakeConstraints { (make) in
            make.centerX.equalTo((self.navigationController?.navigationBar.snp.centerX)!)
            make.centerY.equalTo((self.navigationController?.navigationBar.snp.centerY)!)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            UIView.transition(from: searchRentals, to: searchRides, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        break
        case 1:
           UIView.transition(from: searchRides, to: searchRentals, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        break
        default:
            break
        }
    }
    

}
