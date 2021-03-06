//
//  Header.swift
//  Examples
//
//  Created by Igor Vedeneev on 03.12.17.
//  Copyright © 2017 Igor Vedeneev. All rights reserved.
//

import UIKit
import CollectionKit

class HeaderViewModel {
    var title: String?
    var handler: (() ->Void)?
}

final class Header: UICollectionReusableView {
    let titleLabel = UILabel()
    var viewModel: HeaderViewModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        titleLabel.frame = CGRect(x: 20, y: 20, width: frame.width, height: 13)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        viewModel.handler?()
    }
}

extension Header : ConfigurableCollectionItem {
    func configure(item: HeaderViewModel) {
        self.viewModel = item
        titleLabel.text = item.title?.uppercased()
    }
    
    static func estimatedSize(item: HeaderViewModel?, collectionViewSize: CGSize) -> CGSize {
        return CGSize(width: collectionViewSize.width, height: 48)
    }
}
