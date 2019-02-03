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
        
        segmentedControl.snp.remakeConstraints { (make) in
            make.centerX.equalTo((self.navigationController?.navigationBar.snp.centerX)!)
            make.centerY.equalTo((self.navigationController?.navigationBar.snp.centerY)!)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        let searchRides = SearchRides(frame: view.bounds)
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            self.view.addSubview(searchRides)
        break // Uno
        case 1:
            
        break // Dos
        default:
            break
        }
    }
    

}
