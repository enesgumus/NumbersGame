//
//  SonucViewController.swift
//  SayiTahminEtmeOyunu
//
//  Created by Enes Gümüş on 18.07.2023.
//

import UIKit

class SonucViewController:
    UIViewController {
    
    
    @IBOutlet weak var imageSonuc: UIImageView!
    
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç Ekranı"
        print(sonuc!)
        
        if sonuc! {
            sonucLabel.text = "Kazandınız"
            imageSonuc.image = UIImage(named: "mutlu_resim")
            
        }
        else {
            sonucLabel.text = "Kaybettiniz"
            imageSonuc.image = UIImage(named: "mutsuz_resim")
        }
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
