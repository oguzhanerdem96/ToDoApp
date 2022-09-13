//
//  GuncelleInteractor.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation
class GuncelleInteractor: PresenterToInteractorGuncelleProtocol {
    
    let db: FMDatabase?
    init(){
      
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("MyVeritabani.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func PresenterToDoGuncelle(yapilacak_is: String, yapilacak_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE todolar SET yapilacak_is = ? WHERE yapilacak_id = ? ", values: [yapilacak_is, yapilacak_id])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()    }
    
  
}
