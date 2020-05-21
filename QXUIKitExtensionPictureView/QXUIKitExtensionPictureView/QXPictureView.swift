//
//  QXPictureView.swift
//  QXUIKitExtension
//
//  Created by labi3285 on 2019/10/30.
//  Copyright © 2019 labi3285_lab. All rights reserved.
//

import UIKit
import QXUIKitExtension
import QXDSImageBrowse

open class QXPictureView: QXImageView {
            
    public var picture: QXImage? {
        set { image = newValue }
        get { return image }
    }
    
    public var handlerPreview: (() -> ())?

    public override init() {
        super.init()
        isUserInteractionEnabled = true
        uiImageView.contentMode = .scaleAspectFill
        uiImageView.clipsToBounds = true
        handlerPreview = { [weak self] in
            if let s = self {
                let item = DSImageScrollItem()
                item.localImage = s.image?.uiImage
                item.largeImageURL = s.image?.url?.nsURL
                let thumbView = s.uiImageView
                item.largeImageSize = thumbView.size
                item.thumbView = thumbView
                item.isVisibleThumbView = true
                let view = DSImageShowView(items: [item], type: .showTypeDefault)
                var container = s.uiViewController?.navigationController?.view
                if container == nil {
                    container = s.uiViewController?.view
                }
                if container != nil {
                   view?.presentfromImageView(thumbView, toContainer: container, index: 0, animated: true, completion: {
                   })
                }
            }
        }
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handlerPreview?()
    }
}

open class QXPicturesView: QXArrangeView {
            
    public var pictures: [QXImage] {
        set {
            for e in pictureViews {
                e.isDisplay = false
            }
            for (i, e) in newValue.enumerated() {
                if i < 9 {
                    let v = pictureViews[i]
                    v.isDisplay = true
                    v.picture = e
                }
            }
            qxSetNeedsLayout()
        }
        get {
            return pictureViews.compactMap { $0.image }
        }
    }

    public final lazy var pictureViews: [QXPictureView] = {
        return (0..<self.maxCount).map { (i) -> QXPictureView in
            let e = QXPictureView()
            e.isDisplay = false
            e.handlerPreview = { [weak self] in
                self?.handlePreview(i)
            }
            return e
        }
    }()
    @objc func tapGesture(_ recognizer: UITapGestureRecognizer) {
        handlePreview(recognizer.view?.tag ?? 0)
    }
    
    open func handlePreview(_ currentIndex: Int) {
        var items: [DSImageScrollItem] = []
        var newIndex: Int = 0
        for (i, view) in pictureViews.enumerated() {
            if view.isDisplay {
                let item = DSImageScrollItem()
                item.localImage = view.image?.uiImage
                item.largeImageURL = view.image?.url?.nsURL
                let thumbView = view.uiImageView
                item.largeImageSize = thumbView.size
                item.thumbView = thumbView
                item.isVisibleThumbView = true
                items.append(item)
                if i < currentIndex {
                     newIndex += 1
                }
            }
        }
        let view = DSImageShowView(items: items, type: .showTypeDefault)
        var container = uiViewController?.navigationController?.view
        if container == nil {
            container = uiViewController?.view
        }
        let thumbView = pictureViews[currentIndex].uiImageView
        if container != nil {
            view?.presentfromImageView(thumbView, toContainer: container, index: newIndex, animated: true, completion: {
            })
        }
    }
    
    public let maxCount: Int
    public required init(_ maxCount: Int) {
        self.maxCount = maxCount
        super.init()
        views = pictureViews
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
