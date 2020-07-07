//
//  CellViewModel.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class CellViewModel {

    var userContent: UserContent
    static var placeholder: UIImage?
    var image: Observable<UIImage?>

    init(userContent: UserContent) {
        self.userContent = userContent

        if CellViewModel.placeholder == nil {
            //set Default image if no image is there
            CellViewModel.placeholder = UIImage.init(named: Constants.Imageplaceholder)
        }

        self.image = Observable.init(value: nil)
        self.bindCell()
    }

    var cell: UserContentListTableViewCell? {
        didSet {
            self.cell?.lblTitle.text = self.userContent.title ?? Constants.noTitle
            self.cell?.lblDescription.text = self.userContent.description ?? Constants.noSubtitle

            if let image = self.image.value {
                self.cell?.imgUserContent.image = image
            }
            else {
                self.cell?.imgUserContent.image = CellViewModel.placeholder
                if let imageURL = userContent.imageHref {
                    Alamofire.request(imageURL, method: .get).responseImage { response in
                        switch response.result {
                        case .success(let value):
                        let image = value
                        self.image.value = image
                        case .failure : break
                        //failure will not do anything
                        }
                    }
                }
            }
        }
    }

    private func bindCell() {

        self.image.bindAndFire {
            self.cell?.imgUserContent.image = $0
        }
    }
}
