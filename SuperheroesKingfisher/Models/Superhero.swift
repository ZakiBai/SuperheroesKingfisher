//
//  Superhero.swift
//  SuperheroesKingfisher
//
//  Created by Zaki on 17.05.2023.
//

import Foundation

struct Superhero: Decodable {
    let id: Int
    let name, slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

struct Powerstats: Decodable {
    let intelligence, strength, speed, durability, power, combat: Int
}

struct Appearance: Decodable {
    let gender: Gender
    let race: String?
    let height: [String]
    let weight: [String]
    let eyeColor, hairColor: String
}

enum Gender: String, Decodable {
    case male = "Male"
    case female = "Female"
    case empty = "-"
}
struct Biography: Decodable {
    let fullName, alterEgos: String
    let aliases: [String]
    let placeOfBirth, firstAppearance: String 
    let publisher: String?
    let alignment: Alignment
}

enum Alignment: String, Decodable {
    case bad = "bad"
    case good = "good"
    case empty = "-"
    case neutral = "neutral"
}

struct Work: Decodable {
    let occupation, base: String
}

struct Connections: Decodable {
    let groupAffiliation, relatives: String
}

struct Images: Decodable {
    let xs, sm, md, lg: String
}
