//
//  DogController.swift
//  Dog Pictures
//
//  Created by Don Bouncy on 26/02/2023.
//

import Foundation

struct Dog: Codable{
    let message: String
}

class DogController: ObservableObject{
    @Published var dog: Dog?
    func loadData() async {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            print("Couldn't find resource")
            return
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            let res = response as! HTTPURLResponse
            
            if res.statusCode == 200{
                if let decodedData = try? JSONDecoder().decode(Dog.self, from: data){
                    dog = decodedData
                }
            } else {
                
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
