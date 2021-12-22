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
    
    let redView = UIView()
        redView.backgroundColor = .red                  //cor da redview
        redView.frame = CGRect(x: 0, y: 0, width: 200, height: 300) //transformando a redView em retangulo
        redView.center = view.center                    //centralizaçao
        
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(handlesCard))
        
        redView.addGestureRecognizer(gesture)
        view.addSubview(redView)                        //chamada de view
        
    
    }


}
extension CombineVC {
    @objc func handlesCard(_ gesture: UIPanGestureRecognizer) { // identifica no console aonde o user esta clicando
        if let card = gesture.view {
            let point = gesture.translation(in: view)
            card.center = CGPoint (x: view.center.x + point.x, y: view.center.y + point.y)
            
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.3) {
                    card.center = self.view.center
                }
            }
        }
    }
}
