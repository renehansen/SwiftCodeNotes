//
//  PATs.swift
//  SwiftCodeNotes
//
//  Created by Rene Hansen on 05/03/17.
//  Copyright © 2017 Rene Hansen. All rights reserved.
//

import Foundation


    //Rules about Protocol Associated Types (PATs)
    //- Cannot be used as parameter, return type or in initializer
    //- Cannot be used as a constant, variable or a property
    //- Cannot be used as item in array, dictionary or other container

protocol Food { }
struct Grass: Food { }
struct Clothes { }

protocol Animal {
    associatedtype FoodType //: Food //if we specify a Food constraint, then moth cannot conform to the Animal class as Clothes is not a type of Food.
    func eats(f: FoodType)
}

struct Cow: Animal {
    func eats(f: Grass) { } //would be illegal without associatedtype FoodType on Animal
}

struct Moth: Animal {
    func eats(f: Clothes) { }
}
