//
//  MessagesViewController.swift
//  GoMoreApplication
//
//  Created by Áron Kárpáti on 2019. 02. 02..
//  Copyright © 2019. Áron Kárpáti. All rights reserved.
//

import UIKit
import SnapKit

class MessagesViewController: UIViewController,CustomSegmentedControlDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Messages"
        view.backgroundColor = Theme.color.goGrey()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = Theme.color.goBlue()
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]

        // Do any additional setup after loading the view.
        createSegment()
        rightBarButton()
    }
    
    func changeToIndex(index: Int) {
        switch index {
        case 0:
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            self.navigationItem.rightBarButtonItem?.tintColor = .white
        case 1:
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            self.navigationItem.rightBarButtonItem?.tintColor = .clear
        default:
            break
        }
    }
    
    func rightBarButton(){
        let icon = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(MessagesViewController.iconClick))
        icon.tintColor = .white
        self.navigationItem.rightBarButtonItem = icon
    }
    
    @objc func iconClick(){
        print("click")
    }
    
    func createSegment(){
        let topAnchor = view.safeAreaInsets.top
        let segment = CustomSegmentedControl(frame: CGRect(x: 0, y: topAnchor, width: self.view.frame.width, height: 50), buttonTitle: ["Inbox","Archive"])
        segment.backgroundColor = .white
        segment.selectorTextColor = .black
        segment.selectorViewColor = Theme.color.goBlue()
        segment.delegate = self
        
        view.addSubview(segment)
    }


}
