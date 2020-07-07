//
//  UserContentListTableViewCell.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SnapKit

class UserContentListTableViewCell: UITableViewCell {
    
let imgUserContent: UIImageView = {
        let imgVw = UIImageView()
        imgVw.image = UIImage(named: "Imageplaceholder")
        return imgVw
    }()

    // Added the Title label
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = UIColor.red
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return lbl
    }()

    // Added Description label
    let lblDescription: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.blue
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCell()
    }

    // MARK: - Set up cell

    private func setUpCell() {
        // Added all the cell component to the contentview
        contentView.addSubview(imgUserContent)
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)

        setConstraints()
    }

    // MARK: - Set Constraints

    private func setConstraints() {
        let margin = Constants.constantMarginInCell
        // Set constarints for UI elements
        imgUserContent.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(margin)
            make.top.equalToSuperview().inset(margin)
            make.size.equalTo(CGSize(width: 80, height: 80))
            make.bottom.lessThanOrEqualToSuperview().inset(margin)
        }

        lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(imgUserContent.snp.trailing).offset(margin)
            make.top.equalToSuperview().inset(margin)
            make.trailing.equalToSuperview().inset(margin)
        }

        lblDescription.snp.makeConstraints { (make) in
            make.leading.equalTo(imgUserContent.snp.trailing).offset(margin)
            make.top.equalTo(lblTitle.snp.bottom)
            make.trailing.equalToSuperview().inset(margin)
            make.bottom.equalToSuperview().inset(margin)
        }

    }

}
