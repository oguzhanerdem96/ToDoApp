//
//  EkleInteractor.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation

class EkleInteractor: PresenterToInteractorEkleProtocol{
    
    let db: FMDatabase?
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("MyVeritabani.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func PresenterToDoEkle(yapilacak_is: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO todolar (yapilacak_is) VALUES (?,?)", values: [yapilacak_is])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
          }
    }

