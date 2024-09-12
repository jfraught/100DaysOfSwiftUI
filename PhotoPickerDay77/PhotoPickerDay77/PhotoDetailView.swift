//
//  PhotoDetailView.swift
//  PhotoPickerDay77
//
//  Created by Jordan Fraughton on 9/5/24.
//

import MapKit
import SwiftUI

struct PhotoDetailView: View {
    var userImage: UserImage
    var startingPosition: MapCameraPosition
    
    var body: some View {
        Map(initialPosition: startingPosition) {
            Marker("Pin" ,coordinate: userImage.location)
        }
    }
    
    init(userImage: UserImage) {
        self.userImage = userImage
        
        startingPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: userImage.location,
                span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
            )
        )
    }
}

