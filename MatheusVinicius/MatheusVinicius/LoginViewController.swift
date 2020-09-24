//
//  LoginViewController.swift
//  MatheusVinicius
//
//  Created by COTEMIG on 24/09/20.
//  Copyright © 2020 404Errror. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        if txtUser.text == "admin" && txtPass.text == "1234" {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }else{
            let alert = UIAlertController(title: "Alerta",
                                          message: "Usurio ou Senha Invalidos",
                                          preferredStyle: .alert)
            
            let acaoCancel = UIAlertAction(title: "Cancelar", style: .cancel)
            
            alert.addAction(acaoCancel)
            present(alert, animated: true)
        }
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
