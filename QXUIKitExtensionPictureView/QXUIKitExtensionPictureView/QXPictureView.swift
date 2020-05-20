//
//  QXPictureView.swift
//  QXUIKitExtension
//
//  Created by labi3285 on 2019/10/30.
//  Copyright © 2019 labi3285_lab. All rights reserved.
//

import UIKit
import QXUIKitExtension
import DSImageBrowse

open class QXPictureView: QXImageView {
        
    public var index: Int = 0
    
    public var picture: QXImage? {
        set { image = newValue }
        get { return image }
    }
    
    open func handlePreview() {
        guard let url = image?.url?.nsURL else {
            return
        }
        let item = DSImageScrollItem()
        item.largeImageURL = url
        let thumbView = uiImageView
        item.largeImageSize = thumbView.size
        item.thumbView = thumbView
        item.isVisibleThumbView = true
        let view = DSImageShowView(items: [item], type: .showTypeDefault)
        var container = qxViewController?.navigationController?.view
        if container == nil {
           container = qxViewController?.view
        }
        if container != nil {
           view?.presentfromImageView(thumbView, toContainer: container, index: index, animated: true, completion: {
           })
        }
    }
    public override init() {
        super.init()
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        addGestureRecognizer(tap)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func tapGesture(_ recognizer: UITapGestureRecognizer) {
        handlePreview()
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
                    v.image = e
                }
            }
            qxSetNeedsLayout()
        }
        get {
            return pictureViews.compactMap { $0.image }
        }
    }

    public final lazy var pictureViews: [QXImageView] = {
        return (0..<self.maxCount).map { (i) -> QXImageView in
            let e = QXImageView()
            e.contentMode = .scaleAspectFill
            e.clipsToBounds = true
            e.isDisplay = false
            e.isUserInteractionEnabled = true
            e.tag = i
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
            e.isUserInteractionEnabled = true
            e.addGestureRecognizer(tap)
            return e
        }
    }()
    @objc func tapGesture(_ recognizer: UITapGestureRecognizer) {
        handlePreview(recognizer.view?.tag ?? 0)
    }
    
    open func handlePreview(_ currentIndex: Int) {
        if pictureViews[currentIndex].image?.url?.nsURL == nil {
            return
        }
        var items: [DSImageScrollItem] = []
        var newIndex: Int = 0
        for (i, view) in pictureViews.enumerated() {
            if view.isDisplay {
                if let url = view.image?.url?.nsURL {
                    let item = DSImageScrollItem()
                    item.largeImageURL = url
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
        }
        let view = DSImageShowView(items: items, type: .showTypeDefault)
        var container = qxViewController?.navigationController?.view
        if container == nil {
            container = qxViewController?.view
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
