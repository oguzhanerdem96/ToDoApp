//
//  GuncelleRouter.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation

class GuncelleRouter: PresenterToRouterGuncelleProtocol{
    static func createModule(ref: GuncelleVC) {
        ref.GuncellePresenterNesnesi = GuncellePresenter()
        ref.GuncellePresenterNesnesi?.todoGuncelleInteractor = GuncelleInteractor()
    }
}
