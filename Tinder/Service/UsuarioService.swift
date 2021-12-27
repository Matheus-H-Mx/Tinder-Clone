//
//  UsuarioService.swift
//  Tinder
//
//  Created by Matheus Henrique on 23/12/21.
//

import Foundation

class UsuarioService {
    static let shared = UsuarioService()
    
    let usuarios: [Usuario] = [
    Usuario(id: 101, nome: "Maria Silva", idade: 21, match: true, frase: "não sei como vim parar aqui", foto: "pessoa-1"),
    Usuario(id: 102, nome: "Debora Lima", idade: 25, match: false, frase: "Deu like sem querer?", foto: "pessoa-2"),
    Usuario(id: 103, nome: "Samdra Souza", idade: 24, match: false, frase: "Acho que a gente conbina", foto: "pessoa-3"),
    Usuario(id: 104, nome: "Anna Beatriz", idade: 22, match: true, frase: "não bebo ,não fumo e nao curto balada", foto: "pessoa-4"),
    Usuario(id: 105, nome: "Laura Oliveira", idade: 26, match: true, frase: "Quer saber mais sobre mim?", foto: "pessoa-5"),
    Usuario(id: 106, nome: "Silva Paz", idade: 48, match: false, frase: "se não sabe conversar ne da like", foto: "pessoa-6"),
    Usuario(id: 107, nome: "Maria Silva", idade: 25, match: false, frase: "Em busca de amizades", foto: "pessoa-7"),
    Usuario(id: 108, nome: "Samdra Silva", idade: 23, match: true, frase: "não sei como vim parar aqui", foto: "pessoa-8"),
    Usuario(id: 109, nome: "Tah Beatriz", idade: 22, match: true, frase: "não sei como vim parar aqui", foto: "pessoa-9"),
    Usuario(id: 110, nome: "Laura Oliveira", idade: 26, match: false, frase: "Deu like sem querer?", foto: "pessoa-10"),
    Usuario(id: 111, nome: "Sabrina Santos", idade: 21, match: false, frase: "Acho que a gente conbina", foto: "pessoa-11"),
    Usuario(id: 112, nome: "Amelia Martins", idade: 30, match: true, frase: "não bebo ,não fumo e nao curto balada", foto: "pessoa-12"),
    Usuario(id: 113, nome: "Laura Komako", idade: 27, match: true, frase: "Quer saber mais sobre mim?", foto: "pessoa-13"),
    Usuario(id: 114, nome: "Amelia Rosa", idade: 18, match: false, frase: "se não sabe conversar ne da like", foto: "pessoa-14"),
    Usuario(id: 115, nome: "Nadia Silva", idade: 35, match: false, frase: "Em busca companias", foto: "pessoa-15"),
    Usuario(id: 116, nome: "Mary Isa", idade: 23, match: true, frase: "não sei como vim parar aqui", foto: "pessoa-16"),
    Usuario(id: 117, nome: "Maria Lobato", idade: 21, match: true, frase: "não sei como vim parar aqui", foto: "pessoa-17"),
    Usuario(id: 118, nome: "Vanessa Cristine", idade: 23, match: true, frase: "Deu like sem querer?", foto: "pessoa-18"),
    Usuario(id: 119, nome: "Samdra Nelle", idade: 24, match: false, frase: "Acho que a gente conbina", foto: "pessoa-19")
    
    ]
    
    func buscaUsuarios (completion: @escaping ([Usuario]?,Error?) -> ()) {
        completion(self.usuarios, nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)       // cria um atraso caso de erro 
        {
            completion(self.usuarios, nil)
        }
       
        }
    }

