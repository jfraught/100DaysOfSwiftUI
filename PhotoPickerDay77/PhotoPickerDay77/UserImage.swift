//
//  UserImage.swift
//  PhotoPickerDay77
//
//  Created by Jordan Fraughton on 9/5/24.
//

import CoreLocation
import SwiftData
import SwiftUI

@Model
class UserImage {
    @Attribute(.externalStorage) var photo: Data
    var name: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(photo: Data, name: String, latitude: Double, longitude: Double) {
        self.photo = photo
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
