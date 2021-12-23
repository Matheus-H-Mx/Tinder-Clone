//
//  ConbineVC.swift
//  Tinder
//
//  Created by Matheus Henrique on 22/12/21.
//

import UIKit

class CombineVC: UIViewController {

    var usuarios: [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
    
        self.buscaUsuarios()
    }
    
    func buscaUsuarios () {
        self.usuarios = UsuarioService.shared.buscaUsuarios()
        self.adicionarCards()

    }

}

extension CombineVC {
    func adicionarCards() {
      
        for usuario in usuarios {
            
            let card = CombineCardView()
      
            card.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 33, height: view.bounds.height * 0.77) //transformando a redView em retangulo
            
                card.center = view.center                    //centralizaçao
                card.usuario = usuario
                card.tag = usuario.id
            
                let gesture = UIPanGestureRecognizer()
                gesture.addTarget(self, action: #selector(handlesCard))
                
                card.addGestureRecognizer(gesture)
                view.insertSubview(card, at: 0)                        //chamada de view
        }
   
    }
}

extension CombineVC {
    @objc func handlesCard(_ gesture: UIPanGestureRecognizer) { // identifica no console aonde o user esta clicando
        if let card = gesture.view {
            let point = gesture.translation(in: view)
            card.center = CGPoint (x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotationAngle = point.x / view.bounds.width * 0.3       //rotação da animação usando o eixo x 
            
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.3) {             //animação de volta ao centro ,apos o gesto acabar
                    card.center = self.view.center
                    card.transform = .identity
                }
            }
        }
    }
}
