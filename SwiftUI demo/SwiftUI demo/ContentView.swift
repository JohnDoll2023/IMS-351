//
//  ContentView.swift
//  SwiftUI demo
//
//  Created by John Doll on 10/25/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DetailView(pokemonIndex: 0)) {
                    HStack {
                        Image("Bulbasaur")
                            .resizable().frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("Bulbasaur")
                            Text("Grass")
                        }
                    }
                    .padding()
                }
                NavigationLink(destination: DetailView(pokemonIndex: 1)) {
                    HStack {
                        Image("Charmander")
                            .resizable().frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("Charmander")
                            Text("Fire")
                        }
                    }
                    .padding()
                }
                NavigationLink(destination: DetailView(pokemonIndex: 2)) {
                    HStack {
                        Image("Squirtle")
                            .resizable().frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("Squirtle")
                            Text("Water")
                        }
                    }
                    .padding()
                }
                NavigationLink(destination: DetailView(pokemonIndex: 3)) {
                    HStack {
                        Image("Metapod")
                            .resizable().frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("Metapod")
                            Text("Bug")
                        }
                    }
                    .padding()
                }
                NavigationLink(destination: DetailView(pokemonIndex: 4)) {
                    HStack {
                        Image("Pidgeot")
                            .resizable().frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("Pidgeot")
                            Text("Flying")
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
