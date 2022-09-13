//
//  ViewController.swift
//  ToDoList
//
//  Created by Oğuzhan Erdem on 13.09.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var yapilacaklarTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yapilacaklarListe = [Entity]()
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        veritabaniKopyala()
        AnasayfaRouter.createModule(ref: self)
        
        
    
    }

    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.tumToDolarıYukle()
    }
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "MyVeritabani", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("MyVeritabani.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı var ")
            
        }else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch {
            }
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(todoListesi: Array<Entity>) {
        self.yapilacaklarListe = todoListesi
        self.yapilacaklarTableView.reloadData()
    }
}

extension AnasayfaVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.Ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacak = yapilacaklarListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacaklarHucre", for: indexPath) as! TableViewHucre
        hucre.bilgiLabel.text = "\(yapilacak.yapilacak_is!)"
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = yapilacaklarListe[indexPath.row]
        performSegue(withIdentifier: "toGuncelle", sender: yapilacak)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGuncelle" {
            let yapilacak = sender as? Entity
            let gidilecekVC = segue.destination as! GuncelleVC
            gidilecekVC.yapilacaklar = yapilacak
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let yapilacak = yapilacaklarListe[indexPath.row]

        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction , view , Bool) in
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacak.yapilacak_is!) silinsin mi ?" , preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in}
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in}
            self.anasayfaPresenterNesnesi?.Sil(yapilacak_id: yapilacak.yapilacak_id!)
            
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            self.present(alert, animated: true)
    }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
