//
//  ContentView.swift
//  iOS_Assignment1_s3928533_KFCRestaurant
//
//  Created by MacBook Pro Của A Tú on 27/07/2024.
//

import SwiftUI

struct Splash: View {
    @State private var showInfo = false
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo Rmit")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Image("LogoKfc")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding()
                Text("My KFC Places").font(.title).bold()
                Text("KFC information and locations for you").font(.subheadline).multilineTextAlignment(.center).padding(.bottom, 100).padding()
                NavigationLink(destination: ListKFC().navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding() // Thêm padding vào văn bản bên trong nút
                        .frame(maxWidth: .infinity) // Đặt chiều rộng tối đa cho button
                        .background(Color.red) // Đặt màu nền cho button
                        .cornerRadius(12) // Đặt bo góc cho button
                        .padding(.horizontal) // Thêm padding ngang
                                            }
                HStack {
                    Spacer()
                    Button(action: {
                                   // Hành động khi nhấn vào biểu tượng
                                        showInfo.toggle()
                                    
                                   print("Info icon pressed")
                               }) {
                                   Image(systemName: "info.circle")
                                       .resizable()
                                       .frame(width: 15, height: 15)
                                       .foregroundColor(.black)
                               }
                               .padding()
                               .sheet(isPresented: $showInfo) {
                                                  InfoView()
                                              }
                }.padding()
            }
            .padding() // Thêm padding cho toàn bộ VStack
        }
        
    }
}

struct InfoView: View {
    var body: some View {
        VStack {
            Text("Info author")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("Name: Tran Hung IT")
                .font(.title2)
                .padding(.bottom, 10)
            
            Text("Code : 12345678")
                .font(.title2)
                .padding(.bottom, 10)
            
            Text("Program: Information technology")
                .font(.title2)
                .padding(.bottom, 10)
            
            Button(action: {
                // Đóng màn hình thông tin
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
            }) {
                Text("Close")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    Splash()
}
