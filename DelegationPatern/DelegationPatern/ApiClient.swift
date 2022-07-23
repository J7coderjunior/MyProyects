//
//  ApiClient.swift
//  DelegationPatern
//
//  Created by St Verty Vernard on 19-07-22.
//

import Foundation

struct PokemonDataModel: Decodable{
    let name: String
    let url: String
}

struct PokemonResponseDataModel : Decodable {
    let pokemons : [PokemonDataModel]
    enum codingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
    
   
}

protocol ApiClientDelegate {
    func upDate(pokemon :PokemonResponseDataModel)
}

class ApiClient {
    var delegate: ApiClientDelegate?
    func getPokemons(){
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=05limit=151")!
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            let dataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data!)
            print("Data\(dataModel)")
            
            self.delegate?.upDate(pokemon: dataModel)
        }
        task.resume()
    }
}
