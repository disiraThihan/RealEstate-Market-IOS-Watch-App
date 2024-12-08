//
//  PropertyListView.swift
//  RealStateMarket Watch App
//
//  Created by Disira Thihan on 2024-06-11.
//

import SwiftUI
import WatchKit

struct RealEstateAgentView: View {
    let realEstate: RealEstate
    
    @State private var isShowingCallConfirmation = false
    
    init(realEstate: RealEstate) {
        self.realEstate = realEstate
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(realEstate.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(realEstate.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.yellow)
                
                VStack {
                    Text("Agent's Mobile Number:")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        isShowingCallConfirmation = true
                    }) {
                        Text(formattedPhoneNumber)
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .underline()
                    }
                }
                
                NavigationLink(destination: RealEstateMapView(location: realEstate.location)) {
                    Text("View on Map")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            .padding()
            .navigationTitle("Agent Details")
        }
        .alert(isPresented: $isShowingCallConfirmation) {
            Alert(
                title: Text("Call Agent"),
                message: Text("Are you sure you want to call \(formattedPhoneNumber)?"),
                primaryButton: .default(Text("Call")) {
                    initiateCall()
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    var formattedPhoneNumber: String {
        let phoneNumber = String(realEstate.contact)
        if phoneNumber.count == 9 {
            let firstPart = phoneNumber.prefix(2)
            let secondPart = phoneNumber.dropFirst(2)
            return "\(firstPart)-\(secondPart)"
        } else {
            return phoneNumber
        }
    }
    
    private func initiateCall() {
        let phoneURL = URL(string: "tel://\(realEstate.contact)")!
        WKExtension.shared().openSystemURL(phoneURL)
    }
}

struct RealEstateAgentView_Previews: PreviewProvider {
    static var previews: some View {
        RealEstateAgentView(realEstate: RealEstate.all()[0])
    }
}
