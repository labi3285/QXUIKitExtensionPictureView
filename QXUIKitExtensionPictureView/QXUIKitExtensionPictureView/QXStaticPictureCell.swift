//
//  QXStaticImageCell.swift
//  QXUIKitExtension
//
//  Created by labi3285 on 2019/10/28.
//  Copyright © 2019 labi3285_lab. All rights reserved.
//

import UIKit
import QXConsMaker
import QXUIKitExtension
import DSImageBrowse

open class QXStaticPictureCell: QXStaticCell {
    
    open override func height(_ model: Any?, _ width: CGFloat) -> CGFloat? {
        pictureView.fixWidth = width
        return pictureView.natureSize.h
    }
    
    public final lazy var pictureView: QXPictureView = {
        let e = QXPictureView()
        e.padding = QXEdgeInsets(5, 15, 5, 15)
        e.respondUpdateImage = { [weak self] in
            self?.tableView?.setNeedsUpdate()
        }
        return e
    }()

    required public init() {
        super.init()
        contentView.addSubview(pictureView)
        pictureView.IN(contentView).LEFT.RIGHT.TOP.BOTTOM.MAKE()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    required public init(_ reuseId: String) {
        fatalError("init(_:) has not been implemented")
    }
    
}
