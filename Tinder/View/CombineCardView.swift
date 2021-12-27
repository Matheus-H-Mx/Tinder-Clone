//
//  CombineCardView.swift
//  Tinder
//
//  Created by Matheus Henrique on 22/12/21.
//

import UIKit

class CombineCardView: UIView {
    
    var usuario: Usuario? {
        didSet{
            if let usuario = usuario {      // recebe dados do Usuario e faz atribuição dos dados
                fotoImageView.image = UIImage(named: usuario.foto)
                nomeLabel.text = usuario.nome
                idadeLabel.text = String(usuario.idade)
                fraseLabel.text = usuario.frase
            }
        }
    }
    
    let fotoImageView: UIImageView = .fotoImageView()
    
    let nomeLabel: UILabel = .textBoldLabel(36, textColor: .white)
    let idadeLabel: UILabel = .textLabel(32, textColor: .white)
    let fraseLabel: UILabel = .textLabel(32, textColor: .white, numberOfLines: 3)
    
    let deslikeIamgeView: UIImageView = .iconCard(named: "card-deslike")        //icon com função pronta da UIImageVie
    let likeIamgeView: UIImageView = .iconCard(named: "card-like")

    override init (frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3                          // espessura da borda
        layer.borderColor = UIColor.lightGray.cgColor    //cor da nossa color
        layer.cornerRadius = 8
        clipsToBounds = true
    
        
        nomeLabel.adicionarShadow()
        idadeLabel.adicionarShadow()
        fraseLabel.adicionarShadow()
        
        addSubview(fotoImageView)
        addSubview(deslikeImageView)
        
        deslikeImageView.preencher(
            top: topAnchor,
            leading: nil,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 20, left: 0, bottom: 20, right: 0)
        )
        
        addSubview(likeImageView),
        likeImageView.preencher(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0)
        )
        
        fotoImageView.preencherSuperview()
        
        let nomeIdadeStackView = UIStackView(arrangedSubviews: [nomeLabel, idadeLabel, UIView()])
        nomeIdadeStackView.spacing = 12
        
        let StackView = UIStackView(arrangedSubviews: [nomeIdadeStackView, fraseLabel])
        StackView.distribution = .fillEqually
        StackView.axis = .vertical
        
        addSubview(StackView)
        StackView.preencher(
            top: nil,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
