//
//  SearchBar.swift
//  iOS_Assignment1_s3928533_KFCRestaurant
//
//  Created by MacBook Pro Của A Tú on 28/07/2024.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.backgroundImage = UIImage() // Bỏ viền trên và dưới
        
        // Ẩn nền của search bar
//        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
//            if let backgroundView = textField.subviews.first {
//                backgroundView.alpha = 0
//            }
//        }
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
