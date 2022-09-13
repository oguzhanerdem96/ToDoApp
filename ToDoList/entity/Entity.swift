//
//  Entity.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import Foundation

class Entity {
    var yapilacak_id: Int?
    var yapilacak_is: String?
    init(yapilacak_id: Int , yapilacak_is: String){
        self.yapilacak_is = yapilacak_is
        self.yapilacak_id = yapilacak_id 
    }
}
