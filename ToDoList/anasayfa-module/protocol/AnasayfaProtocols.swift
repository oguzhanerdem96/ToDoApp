//
//  AnasayfaProtocols.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set }
    var anasayfaIView:PresenterToViewAnasayfaProtocol? {get set }

    func tumToDolarıYukle()
    func Ara(aramaKelimesi:String)
    func Sil(yapilacak_id:Int)
}
protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? {get set }
    func tumToDolarıAl()
    func toDolarıAra(aramaKelimesi:String)
    func toDoSil(yapilacak_id:Int)
}
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(todoListesi:Array<Entity>)
}
protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(todoListesi:Array<Entity>)

}
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}
