//
//  DetailViewController.swift
//  Pokedex
//
//  Created by John Doll on 9/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var userSelection = 0

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        pokemonName.text = pokemons[userSelection].name
        self.title = pokemons[userSelection].name
        pokemonImage.image = UIImage(named: pokemons[userSelection].name)
        pokemonDescription.text = pokemons[userSelection].description
        pokemonType.text = String("Type: " + pokemons[userSelection].type[0])
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
