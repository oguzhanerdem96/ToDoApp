//
//  EkleRouter.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation
class EkleRouter: PresenterToRouterEkleProtocol {
    static func createModule(ref: EkleVC) {
        ref.yapilacakEklePresenterNesnesi = EklePresenter()
        ref.yapilacakEklePresenterNesnesi?.todoEkleInteractor = EkleInteractor()
    }
    
    
    
    
    
}
