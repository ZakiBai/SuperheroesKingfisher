//
//  Superhero.swift
//  SuperheroesKingfisher
//
//  Created by Zaki on 17.05.2023.
//

import Foundation

struct Superhero {
    let id: Int
    let name, slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

struct Powerstats {
    let intelligence, strength, speed, durability, power, combat: Int
}

struct Appearance {
    let gender: Gender
    let race: String
    let height: [String]
    let wright: [String]
    let eyeColor, hairColor: String
}

enum Gender: String {
    case male = "Male"
    case female = "Female"
    case empty = "-"
}
struct Biography {
    let fullName, alterEgos: String
    let aliases: [String]
    let placeOfBirth, firstAppearance, publisher: String
    let alignment: Alignment
}

enum Alignment: String {
    case bad = "bad"
    case good = "good"
    case empty = "-"
    case neutral = "neutral"
}

struct Work {
    let occupation, base: String
}

struct Connections {
    let groupAffiliation, relatives: String
}

struct Images {
    let xs, sm, md, lg: String
}
