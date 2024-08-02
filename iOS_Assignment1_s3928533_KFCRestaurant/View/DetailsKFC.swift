//
//  DetailsKFC.swift
//  iOS_Assignment1_s3928533_KFCRestaurant
//
//  Created by MacBook Pro Của A Tú on 29/07/2024.
//

import SwiftUI
import MapKit
import UIKit

struct KFCDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var place: ListItem
    
    @State private var region: MKCoordinateRegion
    @State private var showMapPinInfo = false
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    init(place: ListItem) {
        self.place = place
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TabView {
                    ForEach(place.imagesSlide, id: \.self) { image in
                        Image(image.name)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                .padding()
                
                Text(place.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text(place.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                Text(place.description)
                    .font(.body)
                    .padding()
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Rating: \(place.rating) Stars")
                    ForEach(0..<place.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .padding()
                
                Map(coordinateRegion: $region, annotationItems: [place]) { place in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)) {
                        Button(action: {
                            showMapPinInfo.toggle()
                        }) {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .popover(isPresented: $showMapPinInfo) {
                            VStack {
                                Text(place.title)
                                    .font(.headline)
                                Text(place.subtitle)
                                    .font(.subheadline)
                            }
                            .padding()
                        }
                    }
                }
                .frame(height: 300)
                .cornerRadius(12)
                .padding()
                Text("More Information")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                HStack {
                    Image("facebook_icon")
                        .resizable()
                        .frame(width: 80, height: 50)
                        .clipShape(Circle())
                    Spacer()
                    Image("ig_icon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Spacer()
                    Image("twitter_icon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        print("Nút bên phải được nhấn")
                    }) {
                        Image(systemName: "arrow.left")  .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(!isDarkMode ? .white :.black)
                    }
                    Text(place.title)
                        .font(.title2)
                        .bold()
                    Spacer()
                    
                }
            }
        }
        .navigationBarTitle(place.title, displayMode: .inline)
    }
}

struct DetailsKFC: View {
    var item: ListItem
    var body: some View {
        NavigationView {
            KFCDetailsView(place: item)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsKFC(ListItem)
//    }
//}
