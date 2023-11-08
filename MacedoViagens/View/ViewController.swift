//
//  ViewController.swift
//  MacedoViagens
//
//  Created by Joao Gabriel Macedo on 25/10/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configuraTableView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.00/255.0, alpha: 1)
        
    }
    func configuraTableView(){
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
    }

    func irParaDetalhe(_ viagem:Viagem?){
        if let viagemSelecionada = viagem{
            let detalheController = DetalheViewController.instanciar(viagemSelecionada)
            navigationController?.pushViewController(detalheController, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell", for: indexPath) as? ViagemTableViewCell else {fatalError("Não foi possivel criar a celula")
            }
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            return celulaViagem
        case .ofertas:
            guard let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else {fatalError("Não foi possivel criar a celula")
            }
            celulaOferta.delegate = self
            celulaOferta.configuraCelula(viewModel?.viagens)
            return celulaOferta
            
        default:
            return UITableViewCell()
        }
    }
    
}
extension ViewController: UITableViewDelegate {
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        switch viewModel?.tipo {
        case .destaques, .internacionais:
            let viagemSelecionada = viewModel?.viagens[indexPath.row]
            irParaDetalhe(viagemSelecionada)
        default:
            break
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraView()
            return headerView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 300
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }
}

extension ViewController: OfertaTableViewCellDelegate{
    func didSelectView(_ viagem: Viagem?) {
        irParaDetalhe(viagem)
    }
}
