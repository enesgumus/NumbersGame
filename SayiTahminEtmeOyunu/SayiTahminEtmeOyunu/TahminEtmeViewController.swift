//
//  TahminEtmeViewController.swift
//  SayiTahminEtmeOyunu
//
//  Created by Enes Gümüş on 18.07.2023.
//

import UIKit

class TahminEtmeViewController: UIViewController {

    
    @IBOutlet weak var kalanHakLabel: UILabel!
    
    @IBOutlet weak var durumLabel: UILabel!
    
    @IBOutlet weak var textfield: UITextField!

    var kalanHak = 5
    var rastgeleSayi : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rastgeleSayi = Int.random(in: 0...100)
        print(rastgeleSayi!)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool{
            let gidilecekVC = segue.destination as! SonucViewController
            gidilecekVC.sonuc = gelenVeri
            
        }
    }
    
    @IBAction func tahminEtButton(_ sender: UIButton) {
        
        if let veri = textfield.text {
            
            if let tahmin = Int(veri) {
                kalanHak -= 1
                durumLabel.isHidden = false
                
                if kalanHak != 0 {
                    
                    if tahmin == rastgeleSayi! {
                        durumLabel.text = "Doğru"
                        let sonuc = true
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    }
                    
                    if tahmin > rastgeleSayi! {
                        durumLabel.text = "Azalt"
                        kalanHakLabel.text = "Kalan Hak: \(kalanHak)"
                    }
                    
                    if tahmin < rastgeleSayi! {
                        durumLabel.text = "Arttır"
                        kalanHakLabel.text = "Kalan Hak: \(kalanHak)"
                    }
                }
                else {
                    let sonuc = false
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    
                    
                }
                textfield.text = ""
            }
        }
    }
    
}
