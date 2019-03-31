//
//  main.swift
//  Lesson4
//
//  Created by Dmitry on 28/03/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//


// пример для утечки памяти
import Foundation

class Human {
    let name: String
    var child = [Human?]()
    weak var father: Human? // weak для определения слабой ссылки, без непросиходит деинициализация и удаление из памяти
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

// пример как использовать структуры и JSON
/*
struct Product: Codable {
    var title: String // три параметра которые есть в JSON файле
    var price: Double
    var quantiy: Int
}

struct ProductList: Codable {
    enum CodingKeys: String, CodingKeys {
        case items
    }
    let items: [Product]
}

 // в классе неудобно использовать по сравнению со структурой
let product: Product = try! JSONDecoder().decode(Product.self, from: data)
*/
