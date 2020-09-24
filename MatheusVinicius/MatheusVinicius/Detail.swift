//
//  Detail.swift
//  MatheusVinicius
//
//  Created by COTEMIG on 24/09/20.
//  Copyright © 2020 404Errror. All rights reserved.
//

import UIKit

class Detail: UIViewController {
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailDesc: UILabel!
    @IBOutlet weak var detailPeso: UILabel!
    @IBOutlet weak var detailPreco: UILabel!
    
    var arma : Armas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gun = arma {
            detailName.text = "Nome: \(gun.nome)"
            detailDesc.text = "Descricao: \(gun.descricao)"
            detailPeso.text = "Peso: \(gun.peso)"
            detailPreco.text = "Preco: R$ \(gun.preco)"
            
            if let url = URL(string: gun.imagens) {
                let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let imagem = UIImage(data: data){
                        DispatchQueue.main.async {
                            self.detailImg.image = imagem
                        }
                    }
                }.resume()
            }
        }
    }
     @IBAction func actionComprar(_ sender: Any) {
        let alert = UIAlertController(title: "Alerta",
                                      message: "Item adicionado ao carrinho",
                                      preferredStyle: .alert)
        
        let acaoCancel = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(acaoCancel)
        present(alert, animated: true)
     }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
