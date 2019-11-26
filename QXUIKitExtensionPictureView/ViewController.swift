//
//  ViewController.swift
//  QXUIKitExtensionPictureView
//
//  Created by labi3285 on 2019/11/1.
//  Copyright © 2019 labi3285_lab. All rights reserved.
//

import UIKit
import QXUIKitExtension

class ViewController: QXTableViewController<Any> {
    
    let image = QXImage(url: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572582530722&di=aaa382cca9720e5fe8b09a17063e3a66&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F43efd35d1e9cadc6d8ff5cdc5faccec06f1082bb4efc4-o8K27E_fw658")
    
    lazy var pictureCell: QXStaticPictureCell = {
        let one = QXStaticPictureCell()
        one.pictureView.isForceImageFill = true
        one.pictureView.picture = self.image
        return one
    }()
    lazy var picturesCell: QXStaticPicturesCell = {
        let one = QXStaticPicturesCell()
        one.picturesView.pictures = [self.image, self.image, self.image, self.image]
        return one
    }()
   
    lazy var section: QXTableViewSection = {
        let one = QXTableViewSection([
            self.pictureCell,
            self.picturesCell,
        ], QXStaticHeaderView(), QXStaticFooterView())
        return one
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        view.qxBackgroundColor = QXColor.yellow
        tableView.sections = [section]
    }

}


