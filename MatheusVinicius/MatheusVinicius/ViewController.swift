//
//  ViewController.swift
//  MatheusVinicius
//
//  Created by COTEMIG on 23/09/20.
//  Copyright © 2020 404Errror. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var ArmasTable: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var ArmaArray: [Armas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ArmasTable.dataSource = self
        ArmasTable.delegate = self
        CallApi()
    }
    
    @IBAction func btnnext(_ sender: Any) {
        
    }
    
    private func CallApi() {
        loading.isHidden = false
        loading.startAnimating()
        let link = URL(string: "https://ios-api.herokuapp.com/armas")!
        URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let data = data {
                do {
                    let armaApi = try JSONDecoder().decode([Armas].self, from: data)
                    self.ArmaArray.append(contentsOf: armaApi)
                    DispatchQueue.main.async {
                        self.ArmasTable.reloadData()
                    }
                    
                } catch {
                    print("Erro de parse")
                }
                
            }
        }.resume()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? Detail, let arma = sender as? Armas {
            viewController.arma = arma
        }
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArmaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "guns", for: indexPath) as? CellArmas {
            let gun = ArmaArray[indexPath.row]
            
            if let url = URL(string: gun.imagens) {
                let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let imagem = UIImage(data: data){
                        DispatchQueue.main.async {
                            cell.imgarmas.image = imagem
                            self.loading.stopAnimating()
                            self.loading.isHidden = true
                        }
                    }
                }.resume()
            }
            
            
            cell.nomearma.text = gun.nome
            cell.precoarma.text = "R$:\(gun.preco)"
            return cell
        } else {
            fatalError("Não foi possivel convertar a celula.")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arma = ArmaArray[indexPath.row]
        performSegue(withIdentifier: "detailCompra", sender: arma)
        
    }
}


