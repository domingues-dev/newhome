//
//  SectionViewModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import UIKit
import IGListKit

class RoomIdeasSectionViewModel: NSObject {
    
    var title: String
    var items: [RoomIdeaViewModel] = []
    
    init(title: String) {
        self.title = title
    }
}

extension RoomIdeasSectionViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let rhs = object as? RoomIdeasSectionViewModel else { return false }
        return title == rhs.title && items == rhs.items
    }
    
}

/* Isto não é a melhor maneira para fazer.. Ter cenas genericas não é mau,
 mas aqui acho que era preferivel ter modelos mais especificos para cada secçao.
 Ao teres assim, estás a acabar por martelar um pouco o código para os section controllers mais à frente.
 É sempre melhor começar com casos especificos, e no fim, se vires padrões nos teus modelos e no código,
 então aí faz se o refactor. É sempre melhor fazer simples ao inicio, e depois refactorizar para melhor a
 estrutura do código.
 
 Eu sugeria este modelo para a primeira secção:
 
 ```
 class RoomIdeasSectionViewModel {
     
     let title: String
     let items: [RoomIdeaViewModel]
     
     init(title: String, items: [RoomIdeaViewModel]) {
         self.title = title
         self.items = items
     }
     
 }

 extension RoomIdeasSectionViewModel: ListDiffable {
     
     func diffIdentifier() -> NSObjectProtocol {
         return title as NSString
     }
     
     func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
         if self === object { return true }
         guard let rhs = object as? RoomIdeasSectionViewModel else { return false }
         return title == rhs.title && items == rhs.items
     }

 }
 ```
 
 Se mais para a frente no projeto tiveres mais modelos e secções deste genero, então aí já podes usar genericos
 para aceitar diferentes tipos de modelos para os items da section. Mas ao inicio é sempre melhor simplificar
 Isto com genericos ficaria algo assim (só para referencia):
 
 ```
 class GenericSectionViewModel<T: ListDiffable & Equatable>: ListDiffable {
     
     let title: String
     let items: [T]
     
     init(title: String, items: [T]) {
         self.title = title
         self.items = items
     }
     
     // MARK: - ListDiffable
     
     func diffIdentifier() -> NSObjectProtocol {
         return title as NSString
     }
     
     func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
         if self === object { return true }
         guard let rhs = object as? GenericSectionViewModel else { return false }
         return title == rhs.title && items == rhs.items
     }
     
 }
 ```
 **/
