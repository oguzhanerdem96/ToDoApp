//
//  GuncellePresenter.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation
class GuncellePresenter: ViewToPresenterGuncelleProtocol {
    var todoGuncelleInteractor: PresenterToInteractorGuncelleProtocol?
    
 
    
    func ViewToDoGuncelle(yapilacak_is: String, yapilacak_id: Int) {
        todoGuncelleInteractor?.PresenterToDoGuncelle(yapilacak_is: yapilacak_is, yapilacak_id: yapilacak_id)
    }
    
    
}
