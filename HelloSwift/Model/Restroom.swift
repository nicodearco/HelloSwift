//
//  Restroom.swift
//  HelloSwift
//

import Foundation
import SwiftUI
import CoreLocation

struct Restroom: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var street: String
    var city: String
    var state: String
    var accessible: Bool
    var unisex: Bool
    var directions: String
    var comment: String
    var created_at: String
    var updated_at: String
    var downvote: Int
    var upvote: Int
    var country: String
    var changing_table: Bool
    
//    private var coordinates: Coordinates
//      var locationCoordinate: CLLocationCoordinate2D {
//          CLLocationCoordinate2D(
//              latitude: coordinates.latitude,
//              longitude: coordinates.longitude)
//      }
//
//      struct Coordinates: Hashable, Codable {
//          var latitude: Double
//          var longitude: Double
//      }
    
}
