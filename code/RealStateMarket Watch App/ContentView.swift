//
//  ContentView.swift
//  RealStateMarket Watch App
//
//  Created by Disira Thihan on 2024-06-11.
//

import SwiftUI

struct RealEstateListView: View {
    let realEstates = RealEstate.all()

    var body: some View {
        NavigationView {
            List(realEstates) { realEstate in
                NavigationLink(destination: RealEstateAgentView(realEstate: realEstate)) {
                    VStack(alignment: .leading, spacing: 10) {
                        AsyncImage(url: URL(string: realEstate.imageURL)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill() // Use scaledToFill for better image presentation
                                    .frame(height: 80)
                                    .cornerRadius(10) // Add corner radius for rounded edges
                                    .clipped() // Clip the image to fit within the frame
                            } else if phase.error != nil {
                                Color.red // Indicates an error.
                                    .frame(height: 80)
                                    .cornerRadius(10)
                            } else {
                                Color.gray // Placeholder while loading.
                                    .frame(height: 80)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal) // Add padding to the image

                        VStack(alignment: .leading, spacing: 5) {
                            Text(realEstate.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(realEstate.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("Real Estate")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RealEstateListView_Previews: PreviewProvider {
    static var previews: some View {
        RealEstateListView()
    }
}
