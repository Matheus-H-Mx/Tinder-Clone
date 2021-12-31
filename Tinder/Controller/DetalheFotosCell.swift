//
//  DetalheFotosCell.swift
//  Tinder
//
//  Created by Matheus Henrique on 31/12/21.
//

import UIKit

class DetalheFotosCell: UICollectionViewCell{
    
    let descricaoLabel: UILabel = .textBoldLabel(16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        descricaoLabel.text = "super recentes Instagram"
        
        addSubview(descricaoLabel)
        descricaoLabel.preencher(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20
                          )
        )
    }
    
    required init(coder:  NSCoder) {
        fatalError()
    }
}
