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
    
    var fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pessoa-1")    // comando q inicia com a image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    let nomeLabel: UILabel = .textBoldLabel(36, textColor: .white)
    let idadeLabel: UILabel = .textLabel(32, textColor: .white)
    let fraseLabel: UILabel = .textLabel(32, textColor: .white, numberOfLines: 3)

    override init (frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3                          // espessura da borda
        layer.borderColor = UIColor.lightGray.cgColor    //cor da nossa color
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nomeLabel.text = "Ana Julia"
        idadeLabel.text = "18"
        
        nomeLabel.adicionarShadow()
        idadeLabel.adicionarShadow()
        fraseLabel.adicionarShadow()
        
        addSubview(fotoImageView)
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
