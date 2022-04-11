//
//  Parser.swift
//  natife_test_ios
//
//  Created by Разработчик on 25.03.2022.
//

import Foundation

struct Parser {
    func parse(comp: @escaping (Welcome)->()){
        let api = URL(string: "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json")
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print("Error")
                return
            }
            do {
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                comp(result)
               // print(result)
                
            } catch {
                
            }
        }.resume()
    }
}
