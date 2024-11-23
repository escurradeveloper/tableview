//
//  ViewController.swift
//  Clase33TableView
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userTableView: UITableView!
    
    //variables
    var arrayUser: [User] = [] //array de tipo User, lo inicializamos vacio porque se carga vacio en primer lugar y luego ya le vamos a asignar datos

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView() //llamamos a la función de la configuración de la tabla
    }
    
    //funciones
    //configurar a la tableView
    func configureTableView() {
        userTableView.delegate = self //delegado
        userTableView.dataSource = self //fuente de datos
        userTableView.rowHeight = 150 //tamaño de la tabla
        userTableView.showsVerticalScrollIndicator = false //esconder la barra del scroll vertical
        userTableView.separatorStyle = .none //hacemos un separador
    }
    
    func addUser() {
        let name = nameTextField.text ?? "" //lo que escribimos el nombre
        let email = emailTextField.text ?? "" //lo que escribimos el email
        arrayUser.append(User(name: name, email: email)) //agregamos los datos al arreglo de usuario
        userTableView.reloadData() //actualizamos tabla
    }
    
    //función para eliminar usuario
    func deleteUser() {
        arrayUser.removeAll() //removemos datos
        userTableView.reloadData() //actualizamos tabla
        clearUser() //llamamos al a función
    }
    
    //función para limpiar datos
    func clearUser() {
        nameTextField.text = "" //limpiar nombre
        emailTextField.text = "" //limpiar email
        nameTextField.becomeFirstResponder() //focus al nombre
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //retornamos uno porque solo hay un table view
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //retornamos la cantidad del arreglo de usuarios
        return arrayUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //llamamos a la celda: UserTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        let user = arrayUser[indexPath.row] //pasamos lo que hay en el arreglo de usuarios
        cell?.configureUser(user: user, viewController: self) //llamamos a la configuración de la celda para que se muestren los datos
        return cell ?? UITableViewCell() //retornamos la celda
    }
    
    @IBAction func didTapAdd(_ sender: UIButton) {
        addUser()
    }
    
    @IBAction func didTapDelete(_ sender: UIButton) {
        deleteUser()
    }
    
    @IBAction func didTapClear(_ sender: UIButton) {
        clearUser()
    }
}
