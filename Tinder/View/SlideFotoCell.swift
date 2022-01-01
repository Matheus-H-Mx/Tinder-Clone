//
//  SlideFotoCell.swift
//  Tinder
//
//  Created by Matheus Henrique on 31/12/21.
//

import UIKit
class SlideFotoCell: UICollectionViewCell {
    
    var fotoImageView: UIImageView = .fotoImageView()           //var transformada em UIImageView
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(fotoImageView)               //retorna a função a imagem apresentada 
        fotoImageView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
