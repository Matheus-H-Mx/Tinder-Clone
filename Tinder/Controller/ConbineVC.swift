//
//  ConbineVC.swift
//  Tinder
//
//  Created by Matheus Henrique on 22/12/21.
//

import UIKit

enum Acao {
    case deslike
    case superlike
    case like
}

class CombineVC: UIViewController {

    var perfilButton: UIButton = .iconMenu(named: "icone-perfil")
    var chatButton: UIButton = .iconMenu(named: "icone-chat")
    var logoButton: UIButton = .iconMenu(named: "icone-logo")
    
    var deslikeButton: UIButton = .iconFooter(named: "icone-deslike")       //chama as configs da lib arquivo UIButton
    var superlikeButton: UIButton = .iconFooter(named: "icone-superlike")   //
    var likeButton: UIButton = .iconFooter(named: "icone-like")             //
    
    var usuarios: [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.systemGroupedBackground
        
        self.adicionarHeader()
        self.adicionarFooter()
        self.buscaUsuarios()
    }
    
    func buscaUsuarios () {
        self.usuarios = UsuarioService.shared.buscaUsuarios()
        self.adicionarCards()
    }

}
extension CombineVC {
    func adicionarHeader () {
        let window = UIApplication.shared.windows.first{ $0.isKeyWindow }
        let top:CGFloat? = window?.safeAreaInsets.top ?? 44
        
        let stackView = UIStackView(arrangedSubviews: [perfilButton, logoButton, chatButton])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.preencher(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: nil,
            padding: .init(top: top ?? <#default value#>!, left: 16, bottom: 0, right: 16)
            
        )
    }
    func adicionarFooter () {
        let stackView = UIStackView(arrangedSubviews: [UIView(), deslikeButton, superlikeButton, likeButton,UIView()])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.preencher(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 34, right: 16)
        )
            
        deslikeButton.addTarget(self, action: #selector(deslikeClique), for: .touchUpInside)
        superlikeButton.addTarget(self, action: #selector(superlikeClique), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likeClique), for: .touchUpInside)
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
    func removerCard (card: UIView){
        card.removeFromSuperview()
        self.usuarios = self.usuarios.filter({(usuarios) -> Bool in
            return usuarios.id != card.tag
        })
    }
    func verificarMatch (usuario: Usuario){
        if usuario.match {
            print("wooow")
        }
        
    }
}

extension CombineVC {
    @objc func handlesCard(_ gesture: UIPanGestureRecognizer) { // identifica no console aonde o user esta clicando
    
        if let card = gesture.view as? CombineCardView{
            let point = gesture.translation(in: view)
            
            card.center = CGPoint (x: view.center.x + point.x, y: view.center.y + point.y)
             
            let rotationAngle = point.x / view.bounds.width * 0.4     //rotação da animação usando o eixo x
            
            if point.x > 0 {
                card.likeIamgeView.alpha = rotationAngle * 5
                card.deslikeIamgeView.alpha = 0
            }  else {
                card.likeIamgeView.alpha = 0
                card.deslikeIamgeView.alpha = rotationAngle * 5-1;
            }
             
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            
            
            if gesture.state == .ended {
                
                if card.center.x > self.view.bounds.width + 50 {
                    self.animarCard(rotationAmgle: rotationAngle, acao: .like)
                    return
                    //              print("like")
                    //self.removerCard(card: card)   adiciona logica de remover o card quando LIKE
                }
                
                if card.center.x < 0 - 50 {
                    self.animarCard(rotationAmgle: rotationAngle, acao: .deslike)
                    return
                            //print("deslike")
                    //self.removerCard(card: card) adiciona logica de remover o card quando DESLIKE
                }
                
                UIView.animate(withDuration: 0.3) {             //animação de volta ao centro ,apos o gesto acabar
                    card.center = self.view.center
                    card.transform = .identity
                    
                    card.likeIamgeView.alpha = 0
                    card.deslikeIamgeView.alpha = 0
                }
            }
            
        }
    }
    
    @objc func deslikeClique() {
        self.animarCard(rotationAmgle: -0.4, acao: .deslike)
    }
    @objc func likeClique() {
        self.animarCard(rotationAmgle: 0.4, acao: .like)
    }
    @objc func superlikeClique() {
        self.animarCard(rotationAmgle: 0.4, acao: .superlike)
    }
    
    
    
    func animarCard (rotationAmgle: CGFloat, acao: Acao) {
        if let usuario = self.usuarios.first {
            for view in self.view.subviews{
                if view.tag == usuario.id {
                    if let card = view as? CombineCardView {
                        let center: CGPoint
                        var like: Bool
                        
                        switch acao {
                        case .deslike:
                            center = CGPoint(x: card.center.x - self.view.bounds.width, y: card.center.y + 50)
                            like = false
                        case .superlike:
                            center = CGPoint(x: card.center.x, y: card.center.y - self.view.bounds.height)
                            like = true
                        case .like:
                            center = CGPoint(x: card.center.x + self.view.bounds.width, y: card.center.y + 50)
                            like = true
                        }
//                        UIView.animate(withDuration: 0.2){
//                            card.center = center
//                            card.transform = CGAffineTransform(rotationAngle: rotationAmgle)
//                        }
                        UIView.animate(withDuration: 0.2, animations: {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotationAmgle)
                            
                            card.deslikeIamgeView.alpha = like == false ? 1 : 0
                            card.likeIamgeView.alpha = like == true ? 1 : 0
                        }) { (_) in
                            if like {
                                self.verificarMatch(usuario: usuario)
                            }
                            
                            self.removerCard(card: card)
                    }
                }
            }
        }
        
    }
        
    }
}
