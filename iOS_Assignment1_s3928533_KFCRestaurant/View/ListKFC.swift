//
//  ListKFC.swift
//  iOS_Assignment1_s3928533_KFCRestaurant
//
//  Created by MacBook Pro Của A Tú on 28/07/2024.
//

import SwiftUI

struct ListItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var description: String
    var imageName: String
    var isFavorite: Bool
}

struct ListKFC: View {
    @State private var searchText = ""
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var showFavoritesOnly = false
    @State private var showFavoritesOnly1 = false
    
    @State private var items: [ListItem] = [
          ListItem(title: "Item 1", subtitle: "Subtitle 1",description: "Desc1", imageName: "photo", isFavorite: true),
          ListItem(title: "Item 2", subtitle: "Subtitle 2",description: "Desc2", imageName: "photo", isFavorite: false),
          ListItem(title: "Item 2", subtitle: "Subtitle 2",description: "Desc2", imageName: "photo", isFavorite: false),
          ListItem(title: "Item 3", subtitle: "Subtitle 3",description: "Desc3", imageName: "photo", isFavorite: true),
          ListItem(title: "Item 4", subtitle: "Subtitle 4",description: "Desc4", imageName: "photo", isFavorite: false),
      ]
    
    var listFavorite: [ListItem] {
        return items.filter{
            $0.isFavorite == true
        }
    }
    
    var filteredItems: [ListItem] {
          if searchText.isEmpty {
              return showFavoritesOnly == true ? listFavorite : items
          } else {
              return showFavoritesOnly == true ? listFavorite.filter {
                  $0.isFavorite == true && $0.title.lowercased().contains(searchText.lowercased())
              } : items.filter { $0.title.lowercased().contains(searchText.lowercased())
              }
          }
      }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText).padding(.top)
                Toggle(isOn: $showFavoritesOnly) {
                                    Text("Show places the best")
                                }
                                .padding()
                if(filteredItems.isEmpty) {
                    Text("No data")
                                         .font(.headline)
                                         .foregroundColor(.gray)
                                         .padding()
                }
                List(filteredItems) { item in
                    NavigationLink(destination: DetailsKFC(item: item)) {
                                    HStack {
                                        Image(systemName: item.imageName)
                                            .resizable()
                                            .frame(width: 50, height: 45)
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(8)
                                            .padding(.trailing, 10)
                                        
                                        VStack(alignment: .leading) {
                                            Text(item.title)
                                                .font(.headline)
                                            Text(item.subtitle)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        Spacer()
                                        Button(action: {
                                            // Action when heart is tapped
                                        }) {
                                            Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                                                .resizable()
                                                .frame(width: 23, height: 21)
                                                .foregroundColor(item.isFavorite ? .red : .gray)
                                        }
                                    }
                                }
                            }
                      .navigationBarBackButtonHidden(false) // Ẩn nút Back
                      .navigationBarTitleDisplayMode(.inline)
                      .navigationTitle("")
                      .toolbar {
                                      ToolbarItem(placement: .principal) {
                                          HStack {
                                              Text("List Places KFC")
                                                  .font(.title)
                                                  .bold()
                                              Spacer()
                                              Button(action: {
                                                  isDarkMode.toggle()
                                                  print("Nút bên phải được nhấn")
                                              }) {
                                                  Image(systemName: "moon")  .resizable()
                                                      .frame(width: 15, height: 15)
                                                      .foregroundColor(isDarkMode ? .white :.black)
                                              }
                                          }
                                      }
                      }
                  }
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ListKFC()
}
