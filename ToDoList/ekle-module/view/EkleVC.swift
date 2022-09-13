//
//  EkleVC.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import UIKit

class EkleVC: UIViewController {
    @IBOutlet weak var tfAddToDo: UITextField!
    
    var yapilacakEklePresenterNesnesi:ViewToPresenterEkleProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        EkleRouter.createModule(ref: self)

    }
    

    @IBAction func btnEkle(_ sender: Any) {
        if let yi = tfAddToDo.text {
            yapilacakEklePresenterNesnesi?.ViewToDoEkle(yapilacak_is: yi)
        }
    }
    
    
}
