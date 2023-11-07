//
//  DetalheViewController.swift
//  MacedoViagens
//
//  Created by Joao Gabriel Macedo on 06/11/23.
//

import UIKit

class DetalheViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var viagemImage: UIImageView!
    
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
