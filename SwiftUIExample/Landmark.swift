//
//  Landmark.swift
//  SwiftUIExample
//
//  Created by qwerty on 21.02.2020.
//  Copyright © 2020 qwerty. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

extension Landmark {
    var image: Image {
        return Image.init(imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

var landmarkData: [Landmark] {
    let url = Bundle.main.url(forResource: "landmarkData", withExtension: "json")!
    let jsonData = try! Data.init(contentsOf: url)
    let models = try! JSONDecoder.init().decode([Landmark].self, from: jsonData)
    
    return models
}
