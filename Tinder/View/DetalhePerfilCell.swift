//
//  DetalhePerfilCell.swift
//  Tinder
//
//  Created by Matheus Henrique on 30/12/21.
//

import UIKit

class DetalhePerfilCell: UICollectionViewCell {
    
    var usuario: Usuario? {
        didSet {
            if let usuario = usuario {
                nomeLabel.text = usuario.nome
                idadeLabel.text =  String(usuario.nome)
                fraseLabel.text = usuario.frase
            }
        }
    }
    
    let nomeLabel: UILabel = .textBoldLabel(32)
    let idadeLabel: UILabel = .textLabel(28)
    let fraseLabel: UILabel = .textLabel(18, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        let nomeIdadeStackView = UIStackView(arrangedSubviews: [nomeLabel,idadeLabel, UIView()])
        nomeIdadeStackView.spacing = 12
        
        let stackview = UIStackView(arrangedSubviews: [nomeIdadeStackView, fraseLabel])
        stackview.distribution = .fillEqually
        stackview.axis = .vertical
        
        addSubview(stackview)
        stackview.preencherSuperview(padding: .init(
            top: 20,
            left: 20,
            bottom:  20,
            right:  20
        ))
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
}
