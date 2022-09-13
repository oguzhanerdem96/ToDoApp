//
//  AnasayfaInteractor.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    let db: FMDatabase?
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("MyVeritabani.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
   
    func tumToDolarıAl() {
        
        var liste = [Entity]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM todolar ", values: nil)
            while rs.next() {
                let toDo = Entity(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))!, yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                liste.append(toDo)
            }
            anasayfaPresenter?.presenteraVeriGonder(todoListesi: liste)

        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func toDolarıAra(aramaKelimesi: String) {
        var liste = [Entity]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM todolar WHERE yapilacak_is like  '%\(aramaKelimesi)%'", values: nil)
            while rs.next() {
                let toDo = Entity(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))!, yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                liste.append(toDo)
            }
            anasayfaPresenter?.presenteraVeriGonder(todoListesi: liste)

        }catch {
            print(error.localizedDescription)
        }
        db?.close()

    }
    func toDoSil(yapilacak_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM todolar WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumToDolarıAl()
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
          }
    
    
}
