//
//  ListKFC.swift
//  iOS_Assignment1_s3928533_KFCRestaurant
//
//  Created by MacBook Pro Của A Tú on 28/07/2024.
//

import SwiftUI

struct ImageItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct ListItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var description: String
    var imageName: String
    var isFavorite: Bool
    var rating: Int
    var latitude: Double
    var longitude: Double
    var imagesSlide: [ImageItem]
}

struct ListKFC: View {
    @State private var searchText = ""
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var showFavoritesOnly = false
    @State private var showFavoritesOnly1 = false
    
    @State private var items: [ListItem] = [
        ListItem(title: "KFC Thang Long Hotel", subtitle: "34 Hang Bun Ward.\nOpen 10 AM – 10 PM",description: "Tọa lạc tại trung tâm thương mại sầm uất của thủ đô, KFC Thăng Long mang đến không gian sang trọng và thực đơn phong phú, đáp ứng nhu cầu ẩm thực của mọi lứa tuổi.", imageName: "images", isFavorite: true,
                 rating: 4,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images4"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC Ba Trieu", subtitle: "292 Ba Trieu Ward.\nOpen 10 AM – 10 PM",description: "Nằm trong Vincom Bà Triệu, một trong những trung tâm mua sắm lớn nhất Hà Nội, KFC Vincom Bà Triệu là địa điểm lý tưởng để thưởng thức bữa ăn nhanh gọn và ngon miệng sau những giờ mua sắm thỏa thích.", imageName: "images2", isFavorite: false, rating: 5,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images4"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC Hoan Kiem Lake", subtitle: "51 Luong Van Can.\nOpen 9 AM – 10 PM",description: "Tại KFC Royal City, bạn có thể thưởng thức các món gà rán ngon lành sau khi tham gia các hoạt động vui chơi giải trí tại khu tổ hợp Royal City.", imageName: "images3", isFavorite: false , rating: 4,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images7"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC Cau Giay", subtitle: "374 Cau Giay Street.\nOpen 10 AM – 10 PM",description: "Tại KFC Royal City, bạn có thể thưởng thức các món gà rán ngon lành sau khi tham gia các hoạt động vui chơi giải trí tại khu tổ hợp Royal City.", imageName: "images3", isFavorite: true, rating: 5,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images6"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC Big C", subtitle: "222 Tran Duy Hung Street.\nOpen 10 AM – 10 PM",description: "Sau những giờ mua sắm tại Aeon Mall Tân Phú, KFC là nơi dừng chân lý tưởng để thưởng thức món gà rán nổi tiếng với không gian thoáng đãng và phục vụ tận tình.", imageName: "images4", isFavorite: false, rating: 4,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC Trung Hoa", subtitle: "Lot 13B, Urban Area, Trung Yen 11.\nOpen 10 AM – 10 PM",description: "Với tầm nhìn tuyệt đẹp từ tầng cao của Lotte Center, KFC tại đây không chỉ mang đến hương vị gà rán quen thuộc mà còn là một trải nghiệm ẩm thực khó quên với khung cảnh toàn thành phố.", imageName: "images5", isFavorite: false, rating: 3,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images6"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC 330 Trần Hưng Đạo", subtitle: "13BP, Urban Area, Tran Hung Dao 11.\nOpen 10 AM – 10 PM",description:  "Với tầm nhìn tuyệt đẹp từ tầng cao của Lotte Center, KFC tại đây không chỉ mang đến hương vị gà rán quen thuộc mà còn là một trải nghiệm ẩm thực khó quên với khung cảnh toàn thành phố.", imageName: "images6", isFavorite: false, rating: 4,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images9"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC 116 - 118 Hai Bà Trưng", subtitle: "116 Hai Ba Trung Street.\nOpen 10 AM – 10 PM",description: "Với vị trí đắc địa tại tòa nhà Bitexco Financial Tower, KFC tại đây không chỉ mang đến món gà rán hấp dẫn mà còn là nơi lý tưởng để ngắm nhìn toàn cảnh thành phố từ trên cao.", imageName: "images7", isFavorite: false, rating: 5,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images10"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC 77 Cộng Hòa", subtitle: "77  Cong Hoa Ward.\nOpen 10 AM – 10 PM",description: "Nằm trong trung tâm thương mại Saigon Centre, KFC mang đến không gian sang trọng và dịch vụ chất lượng, là địa điểm lý tưởng để gặp gỡ bạn bè và gia đình.", imageName: "images8", isFavorite: false, rating: 4,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC AEON Mall Bình Tân", subtitle: "4 AEON MALL, Binh Tan Street.\nOpen 10 AM -  10 PM",description: "KFC Nguyễn Văn Cừ nằm tại ngã tư sầm uất của quận 5, là địa điểm quen thuộc của giới trẻ và các gia đình muốn thưởng thức bữa ăn nhanh ngon miệng và tiện lợi.", imageName: "images9", isFavorite: false, rating: 4,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images8"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
        ListItem(title: "KFC 24B Võ Văn Ngân", subtitle: "24B Vo Van Ngan Street.\nOpen 10 AM -  10 PM",description: "KFC Times City là điểm dừng chân lý tưởng cho các gia đình sau những giờ vui chơi tại khu vui chơi VinKE & Vinpearl Aquarium. Không gian rộng rãi và thân thiện với trẻ em.", imageName: "images10", isFavorite: false, rating: 5,
                 latitude: 10.8231,
                 longitude: 106.6297,
                 imagesSlide: [ImageItem(name: "images5"), ImageItem(name: "images2"), ImageItem(name: "images3")]),
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
                    NavigationLink(destination: DetailsKFC(item: item).navigationBarBackButtonHidden(true) ) {
                        HStack {
                            Image(item.imageName)
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
                                    .foregroundColor(!isDarkMode ? .white :.black)
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
