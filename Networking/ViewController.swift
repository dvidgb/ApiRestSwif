//
//  ViewController.swift
//  Networking
//
//  Created by David Bueno on 5/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
   
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
     
        nameLabel.text = ""
        emailLabel.text = ""
        
        
       //no muestra el indicador de actividad
        //Cuando iniciamos la aplicación
        activityIndicator.hidesWhenStopped = true
        
       
    }


    @IBAction func getUserAction(_ sender: Any) {
      
        //se activa el indicador de actividad
        activityIndicator.startAnimating()
        NetworkingProvider.shared.getUser(id: 121) { (user) in
            //cuando tenemos datos se oculta
            self.activityIndicator.stopAnimating()
            
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
            
        } failure: { (error) in
            self.activityIndicator.stopAnimating()
            
            
            // en caso de que ocurre un error nos lo muestra en el label del nombre
            self.nameLabel.text = error.debugDescription
        }

        
    }//fin action
    
    
    @IBOutlet weak var labelEmailAction: UILabel!
}

