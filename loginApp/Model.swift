//
//  Model.swift
//  loginApp
//
//  Created by Роман on 02.11.2021.
//

import Foundation
import CoreImage
 
struct User{
    var login: String
    var password: String
    var person: Person
    static func getDataUser() -> User{
        User(login: "User",
             password: "password",
             person: Person.getPerson())
    }
}

struct Person {
    var firstName: String
    var secondName: String
    var image: String
    var fullName: String{
        "\(firstName) \(secondName)"
    }
}



enum HobbiesType {
    case walk
    case job
    case developing
    
    var definition: String {
        switch self {
        case .walk:
            return "Люблю прогулки, они очень полезны для здоровья особенно если у тебя сидячий образ жизни"
        case .job:
            return "Работаю я в Роскосмос, занимаюсь произвдством, частей космических аппаратов"
        case .developing:
            return "В сободное время я занимюсь разработкой под iOS так, как это увлекательный процесс"
        }
    }
}


extension Person{
    static func getPerson() -> Person{
        return
            Person(firstName: "Roman",
                   secondName: "Naumov",
                   image: "sYSVGrZAO8Y"
                  )
            }
    
}
