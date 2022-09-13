//
//  AnasayfaPresenter.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation
class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaIView: PresenterToViewAnasayfaProtocol?
    func tumToDolarıYukle() {
        anasayfaInteractor?.tumToDolarıAl()
    }
    func Ara(aramaKelimesi: String) {
        anasayfaInteractor?.toDolarıAra(aramaKelimesi: aramaKelimesi)
    }
    
    func Sil(yapilacak_id: Int) {
        anasayfaInteractor?.toDoSil(yapilacak_id: yapilacak_id)
    }
}
extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(todoListesi: Array<Entity>) {
        anasayfaIView?.vieweVeriGonder(todoListesi: todoListesi)
    }
    
    
}
