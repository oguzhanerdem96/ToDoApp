//
//  GuncelleVC.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import UIKit

class GuncelleVC: UIViewController {

    @IBOutlet weak var tfGuncelleTextField: UITextField!
    
    var yapilacaklar: Entity?
    
    var GuncellePresenterNesnesi: ViewToPresenterGuncelleProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let y = yapilacaklar {
            tfGuncelleTextField.text = y.yapilacak_is
        }
        GuncelleRouter.createModule(ref: self)
    }
    

    @IBAction func btnGuncelle(_ sender: Any) {
        if let yi = tfGuncelleTextField.text , let y = yapilacaklar {
            GuncellePresenterNesnesi?.ViewToDoGuncelle(yapilacak_is: yi, yapilacak_id: y.yapilacak_id!)
        }
       
    }
    
}
