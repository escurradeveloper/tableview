//
//  User.swift
//  Clase33TableView
//
//  Created by Escurra Colquis on 23/11/24.
//

import Foundation

//Clase User con Identifiable para que tenga un id unico
class User: Identifiable {
    var id: UUID = UUID() //tipo de dato UUID
    var name: String //name: tipo de dato string
    var email: String //email: tipo de dato string
    
    //inicializador
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
