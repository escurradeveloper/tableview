//
//  UserTableViewCell.swift
//  Clase33TableView
//
//  Created by Escurra Colquis on 23/11/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user: User? //user
    var viewController: UIViewController? //viewController
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none //ninguna selección de color
        backgroundColor = UIColor.clear //la celda su background no tenga color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //funciones
    //para configurar y cargar el contenido de la tabla
    func configureUser(user: User, viewController: UIViewController) {
        self.nameLabel.text = user.name //le pasamos el nombre
        self.emailLabel.text = user.email //le pasamos el email
        self.user = user //le pasamos al user
        self.viewController = viewController //le pasamos al mismo viewController
    }
}
