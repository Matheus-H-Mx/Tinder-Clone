//
//  ConbineVC.swift
//  Tinder
//
//  Created by Matheus Henrique on 22/12/21.
//

import UIKit

class CombineVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
    
    
        
        self.adicionarCards()
    }


}

extension CombineVC {
    func adicionarCards() {
      
        for item in 1...3 {
            
            let redView = UIView()
            redView.backgroundColor = item == 2 ? .blue : .red                  //cor da redview
            redView.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 33, height: view.bounds.height * 0.77) //transformando a redView em retangulo
                redView.center = view.center                    //centralizaçao
                
                let gesture = UIPanGestureRecognizer()
                gesture.addTarget(self, action: #selector(handlesCard))
                
                redView.addGestureRecognizer(gesture)
                view.addSubview(redView)                        //chamada de view
        }
   
    }
}

extension CombineVC {
    @objc func handlesCard(_ gesture: UIPanGestureRecognizer) { // identifica no console aonde o user esta clicando
        if let card = gesture.view {
            let point = gesture.translation(in: view)
            card.center = CGPoint (x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotationAngle = point.x / view.bounds.width * 0.3
            
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
