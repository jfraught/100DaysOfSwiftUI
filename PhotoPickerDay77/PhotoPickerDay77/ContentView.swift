//
//  ContentView.swift
//  PhotoPickerDay77
//
//  Created by Jordan Fraughton on 9/5/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var userImages: [UserImage]
    
    @State private var showingAddPhoto = false 
    
    var body: some View {
        NavigationStack {
            VStack {
                if userImages.isEmpty {
                    ContentUnavailableView(
                        "No Photos",
                        systemImage: "photo",
                        description: Text("Add a photo please")
                    )
                } else {
                    List {
                        ForEach(userImages) { userImage in
                            NavigationLink {
                                PhotoDetailView(userImage: userImage)
                            } label: {
                                HStack {
                                    if let image = UIImage(data: userImage.photo) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                    } else {
                                        Image(systemName: "photo")
                                    }
                                    Text(userImage.name)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Photos")
            .toolbar {
                Button("Add new photo", systemImage: "plus") {
                    showingAddPhoto.toggle()
                }
            }
            .sheet(isPresented: $showingAddPhoto) {
                AddPhotoView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
