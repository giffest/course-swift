//
//  main.swift
//  Lessom4
//
//  Created by Dmitry on 28/03/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import Foundation

class Human {
    let name: String
    var child = [Human?]()
    weak var father: Human?
    weak var mother: Human?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print(self.name + "уничтожен")
    }
}

if 1 == 1 {
    let Kirill = Human(name: "Кирилл")
    let Olga =  Human(name: "Ольга")
    let Alex = Human(name: "Алексей")
    
    Kirill.father = Alex
    Kirill.mother = Olga
    Alex.child.append(Kirill)
    Olga.child.append(Kirill)
}
//
/*
struct Product: Codable {
    var title: String
    var price: Double
    var quantiy: Int
}

struct ProductList: Codable {
    enum CodingKeys: String, CodingKeys {
        case item
    }
    let items: [Product]
}

let product: Product = try! JSONDecoder().decode(Product.self, from: data)
*/
