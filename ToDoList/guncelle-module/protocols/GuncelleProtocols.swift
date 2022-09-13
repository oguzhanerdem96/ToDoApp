//
//  GuncelleProtocols.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation


protocol ViewToPresenterGuncelleProtocol {
    var todoGuncelleInteractor: PresenterToInteractorGuncelleProtocol? {get set}
    
    func ViewToDoGuncelle(yapilacak_is:String, yapilacak_id: Int)

}
protocol PresenterToInteractorGuncelleProtocol {
    func PresenterToDoGuncelle(yapilacak_is:String , yapilacak_id: Int)
}
protocol PresenterToRouterGuncelleProtocol {
    static func createModule(ref: GuncelleVC)
}
