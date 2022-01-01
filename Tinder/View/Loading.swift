//
//  Loading.swift
//  Tinder
//
//  Created by Matheus Henrique on 26/12/21.
//

import UIKit

class Loading: UIView {
    let loadView: UIView = {
        let load = UIView()
        load.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        load.backgroundColor = UIColor(red: 218/255, green: 99/255 , blue: 111/255, alpha: 1)
        load.layer.cornerRadius = 50
        load.layer.borderWidth = 1
        load.layer.borderColor = UIColor.red.cgColor
        return load
    }()
    let perfilImagemView: UIImageView = {
        let imagem = UIImageView()
        imagem.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imagem.layer.cornerRadius = 50
        imagem.layer.borderWidth = 5
        imagem.layer.borderColor = UIColor.white.cgColor
        imagem.image = UIImage(named: "perfil") //imagem de perfil
        return imagem
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       addSubview(loadView)
        loadView.center = center
        
       addSubview(perfilImagemView)
        perfilImagemView.center = center
        
        self.animacao()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implementted")
    }
    func animacao() {
        UIView.animate(withDuration: 1.3, animations: {
            self.loadView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            self.loadView.center = self.center
            self.loadView.layer.cornerRadius = 125
            self.loadView.alpha = 0.3
            
        }) { (_) in
            self.loadView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.loadView.center = self.center
            self.loadView.layer.cornerRadius = 50
            self.loadView.alpha = 1
            
            self .animacao()
            
        }
    }
}
