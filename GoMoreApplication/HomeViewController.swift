//
//  HomeViewController.swift
//  GoMoreApplication
//
//  Created by Áron Kárpáti on 2019. 02. 02..
//  Copyright © 2019. Áron Kárpáti. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController{

    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = Theme.color.goGrey()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        view.backgroundColor = Theme.color.goGrey()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = Theme.color.goBlue()
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomeCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
        setupCollection()
        
    }
    
    func setupCollection(){
        collectionView.snp.remakeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(view.frame.width)
            make.top.equalTo(view.safeAreaInsets.top)
        }
    }


}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomeCell
        cell.backgroundColor  = .white
        cell.layer.cornerRadius = 5
        //cell.layer.shadowOpacity = 3
        cell.imageView.image = UIImage(named: "user")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 140)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    
}

class CustomeCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.backgroundColor = UIColor.gray
        return image
    }()
    
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.text = "What's your phone number?"
        return label
    }()
    
    let midLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.text = "It's required for many actions and increases trust on your profile."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.sizeToFit()

        return label
    }()
    
    
    func  setupView(){
        addSubview(imageView)
        addSubview(textLabel)
        addSubview(midLabel)
        
        imageView.snp.remakeConstraints { (make) in
            make.right.equalTo(self.snp.right).inset(20)
            make.top.equalTo(self.snp.top).inset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        textLabel.snp.remakeConstraints { (make) in
            make.right.equalTo(imageView.snp.right).inset(40)
            make.top.equalTo(imageView.snp.top)
            make.left.equalTo(self.snp.left)
        }
        
        midLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom).offset(10)
            make.left.equalTo(self.snp.left)
            make.height.equalTo(100)
            make.right.equalTo(imageView.snp.right).inset(40)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

