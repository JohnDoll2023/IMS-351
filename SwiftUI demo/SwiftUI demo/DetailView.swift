//
//  DetailView.swift
//  SwiftUI demo
//
//  Created by John Doll on 10/25/22.
//

import SwiftUI

struct DetailView: View {
    var pokemonIndex: Int
    var pokemonNames = ["Bulbasaur", "Charmander", "Squirtle", "Metapod", "Pidgeot"]
    var pokemonTypes = ["Grass", "Fire", "Water", "Bug", "Flying"]
    var pokemonDescriptions = ["Bulbasaur is a small, quadrupedal amphibian Pokémon that has blue-green skin with darker patches. It has red eyes with white pupils, pointed, ear-like structures on top of its head, and a short, blunt snout with a wide mouth. A pair of small, pointed teeth are visible in the upper jaw when its mouth is open. Each of its thick legs ends with three sharp claws. On Bulbasaur's back is a green plant bulb, which is grown from a seed planted there at birth. The bulb also conceals two slender, tentacle-like vines and provides it with energy through photosynthesis as well as from the nutrient-rich seeds contained within.",
                               "Charmander is a bipedal, reptilian Pokémon with a primarily orange body and blue eyes. Its underside from the chest down and the soles of its feet are cream-colored. It has two small fangs visible in its upper jaw and two smaller fangs in its lower jaw. A fire burns at the tip of this Pokémon's slender tail and has blazed there since Charmander's birth. The flame can be used as an indication of Charmander's health and mood, burning brightly when the Pokémon is strong, weakly when it is exhausted, wavering when it is happy, and blazing when it is enraged. It is said that Charmander dies if its flame goes out. However, if the Pokémon is healthy, the flame will continue to burn even if it gets a bit wet and is said to steam in the rain.",
                               "Squirtle is a small reptilian Pokémon that resembles a light-blue turtle. While it typically walks on its two short legs, it has been shown to run on all fours in Super Smash Bros. Brawl. It has large, purplish or reddish eyes and a slightly hooked upper lip. Each of its hands and feet have three pointed digits. The end of its long tail curls inward. Its body is encased by a tough shell that forms and hardens after birth. This shell is brown on the top, pale yellow on the bottom, and has a thick white ridge between the two halves.",
                               "Metapod is an insect Pokémon that resembles a green chrysalis. Its body is crescent-shaped with several segments making up the lower point. The front of Metapod's shell resembles a face with heavy-lidded eyes and a sharply pointed nose. The back of its shell consists of several geometrically shaped portions and projections.",
                               "Pidgeot is an avian Pokémon with large wings, sharp talons, and a short, hooked beak. Its glossy plumage is mostly brown with cream-colored underparts and flight feathers. Its head has a decorated crest that is nearly as long as its body. The center feathers of its crest are yellow, while the outer feathers are red. The fan-like feathers of its tail are red or brown. Its beak and legs are pink, and there are three forward-facing toes and one backward-facing toe on each foot. Behind each eye is an angular black marking."]
    
    @State private var totalPokemonCollected = 0
    
    var body: some View {
        VStack (alignment: .leading){
            Image(pokemonNames[pokemonIndex])
                .resizable().frame(width: 300, height: 300)
            Text(pokemonNames[pokemonIndex]).font(.system(size: 50))
            Spacer()
            Text(pokemonTypes[pokemonIndex]).font(.system(size: 25))
            Spacer()
            Text(pokemonDescriptions[pokemonIndex])
            Spacer()
                .navigationBarTitle(Text(pokemonNames[pokemonIndex]))
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemonIndex: 0)
    }
}
