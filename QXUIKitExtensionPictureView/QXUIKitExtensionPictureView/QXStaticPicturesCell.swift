//
//  QXStaticPicturesCell.swift
//  QXUIKitExtension
//
//  Created by labi3285 on 2019/10/30.
//  Copyright © 2019 labi3285_lab. All rights reserved.
//

import UIKit
import QXConsMaker
import QXUIKitExtension
import QXDSImageBrowse

open class QXStaticPicturesCell: QXStaticCell {
    
    open override func height(_ model: Any?) -> CGFloat? {
        if picturesView.pictures.count == 1 {
            for e in picturesView.pictureViews {
                e.fixWidth = (context?.givenWidth ?? 0) - picturesView.padding.left - picturesView.padding.right
            }
        } else if picturesView.pictures.count == 2 {
            let w = (width - picturesView.padding.left - picturesView.padding.right - picturesView.viewMarginX * 1) / 2
            for e in picturesView.pictureViews {
                e.fixSize = QXSize(w, w)
            }
        } else {
            let w = (width - picturesView.padding.left - picturesView.padding.right - picturesView.viewMarginX * 2) / 3
            for e in picturesView.pictureViews {
                e.fixSize = QXSize(w, w)
            }
        }
        picturesView.fixWidth = width
        return picturesView.natureSize.h
    }
        
    public lazy var picturesView: QXPicturesView = {
        let e = QXPicturesView(9)
        e.padding = QXEdgeInsets(5, 15, 5, 15)
        return e
    }()
    
    required public init() {
        super.init()
        contentView.addSubview(picturesView)
        picturesView.IN(contentView).LEFT.TOP.RIGHT.BOTTOM.MAKE()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    required public init(_ reuseId: String) {
        fatalError("init(_:) has not been implemented")
    }
    
}
