//
//  EklePresenter.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation

class EklePresenter:ViewToPresenterEkleProtocol{
    var todoEkleInteractor: PresenterToInteractorEkleProtocol?
    
    func ViewToDoEkle(yapilacak_is: String) {
        todoEkleInteractor?.PresenterToDoEkle(yapilacak_is: yapilacak_is)
    }
    
    
}
