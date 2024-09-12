//
//  AddPhotoView.swift
//  PhotoPickerDay77
//
//  Created by Jordan Fraughton on 9/5/24.
//

import PhotosUI
import SwiftUI

struct AddPhotoView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var processedImage: UIImage?
    @State private var photoName = ""
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        VStack {
                            Image(uiImage: processedImage)
                                .resizable()
                                .scaledToFit()
                        }
                        .padding()
                    } else {
                        ContentUnavailableView("Add photo", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                
                if processedImage != nil {
                    TextField("Photo name", text: $photoName)
                        .padding()
                }
            }
            .navigationTitle("Add Photo")
            .navigationBarTitleDisplayMode(.inline)
            .buttonStyle(.plain)
            .onChange(of: selectedItem, loadImage)
            .toolbar {
                Button("Save", action: save)
                    .disabled(photoName.isEmpty ? true : false)
            }
        }
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            processedImage = inputImage
        }
    }
    
    func save() {
        guard let imageData = processedImage?.pngData() else { return }
        locationFetcher.start()
        guard let location = locationFetcher.lastKnownLocation else { return }
        let latitude = Double(location.latitude)
        let longitude = Double(location.longitude)
    
        let newImage = UserImage(photo: imageData, name: photoName, latitude: latitude, longitude: longitude)
        
        modelContext.insert(newImage)
        dismiss()
    }
}

#Preview {
    AddPhotoView()
}
