//
//  SearchRentals.swift
//  GoMoreApplication
//
//  Created by Áron Kárpáti on 2019. 02. 03..
//  Copyright © 2019. Áron Kárpáti. All rights reserved.
//

import Foundation
import UIKit

class SearchRentals: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Theme.color.goGrey()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(indButton)
        self.addSubview(contentView)
        contentView.addSubview(cont1Button)
        contentView.addSubview(cont2Button)
        self.addSubview(searchButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        indButton.snp.remakeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(20)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height).dividedBy(2)
        }
        
        contentView.snp.remakeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(indButton.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(120)
        }
        
        cont1Button.snp.remakeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height).dividedBy(2)
        }
        
        cont2Button.snp.remakeConstraints { (make) in
            make.top.equalTo(cont1Button.snp.bottom)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height).dividedBy(2)
        }

        searchButton.snp.remakeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(contentView.snp.bottom).offset(20)
            make.width.equalTo(indButton.snp.width)
            make.height.equalTo(50)
        }
        
        
    }
    let contentView = Theme.View.doubleButtonView()
    let cont1Button = Theme.Buttons.roundedButton(title: "Pick-up date", radius: 0, textColor: Theme.color.goGrey(), bgColor: UIColor.white)
    let cont2Button = Theme.Buttons.roundedButton(title: "Return date", radius: 0, textColor: Theme.color.goGrey(), bgColor: UIColor.white)
    let indButton = Theme.Buttons.roundedButton(title: "Where", radius: 6, textColor: Theme.color.goGrey(), bgColor: UIColor.white)
    let searchButton = Theme.Buttons.roundedButton(title: "Search rentlas", radius: 6, textColor: UIColor.white, bgColor: Theme.color.goGreen())
    
}
