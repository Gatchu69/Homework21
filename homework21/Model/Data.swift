//
//  Data.swift
//  homework21
//
//  Created by Nodiko Gachava on 24.04.24.
//

import UIKit
struct Name: Decodable {
    var official: String?
    var common: String?
}

struct Flags: Decodable {
    var png: String?
    var alt: String?
}

struct Maps: Decodable{
    var googleMaps: String?
    var openStreetMaps: String?
}

struct Country: Decodable {
    var name: Name?
    var flags: Flags?
    var independent: Bool?
    var region: String?
    var area: Double?
    var maps: Maps?
    var startOfWeek: String?
}


