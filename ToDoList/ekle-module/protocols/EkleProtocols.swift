//
//  EkleProtocols.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation

protocol ViewToPresenterEkleProtocol {
    var todoEkleInteractor: PresenterToInteractorEkleProtocol? {get set}
    
    func ViewToDoEkle(yapilacak_is:String)

}
protocol PresenterToInteractorEkleProtocol {
    func PresenterToDoEkle(yapilacak_is:String)
}
protocol PresenterToRouterEkleProtocol {
    static func createModule(ref:EkleVC)
}
