//
//  HomeScreen.swift
//  Furniture App
//
//  Created by Anthony Aniobi on 30/03/2023.
//

import SwiftUI

struct HomeScreen: View {
    @State var selectedCategory = "All"
    @State var goBack = false
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading){
                        AppBarView()
                        TagLineView()
                            .padding()
                        SearchAndScanView()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(categories, id: \.self) { category in
                                    CategoryView(text: category, isActive: category == selectedCategory)
                                        .onTapGesture {
                                            selectedCategory = category
                                        }
                                }
                            }
                        }
                        .padding(.vertical)
                        .padding(.leading)
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(1..<5) { index in
                                    NavigationLink(destination: DetailScreen(goBack: $goBack), isActive: $goBack){
                                        ProductCardView(image: Image("chair_\(index)"), size: 210)
                                    }.foregroundColor(.black)
                                        .navigationBarHidden(true)
                                    
                                }.padding(.trailing)
                            }.padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(1..<5) { index in
                                    ProductCardView(image: Image("chair_\(index)"), size: 180)
                                }.padding(.trailing)
                            }.padding(.leading)
                        }
                        
                    }
                }
                
                // custom bottom navbar
                HStack{
                    BottomNavbarItem(image: Image("home"), action:{})
                    BottomNavbarItem(image: Image("fav"), action:{})
                    BottomNavbarItem(image: Image("shop"), action:{})
                    BottomNavbarItem(image: Image("User"), action:{})
                }.padding()
                    .background(.white)
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 2, y: 6)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action:{}){
                Image("menu")
                    .padding()
                    .background(.white)
                    .cornerRadius(10.0)
            }
            Spacer()
            Button(action:{}){
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }.padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search:String = ""
    var body: some View {
        HStack {
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
                
            }.padding(.all, 20)
                .background(.white)
                .cornerRadius(10.0)
                .padding(.trailing)
            
            Button(action: {}){
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let text:String
    let isActive:Bool
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0){
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Primary"))
                if(isActive){ Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())}
            }
            .padding(.trailing)
        }
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200*(size/210))
                .cornerRadius(20.0)
            Text("Luxry Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(1)
            HStack{
                ForEach(0..<5) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
        }.frame(width: size)
            .padding()
            .background(.white)
            .cornerRadius(20.0)
    }
}

struct BottomNavbarItem: View {
    let image: Image
    let action: ()->Void
    var body: some View {
        Button(action:action){
            image
                .frame(maxWidth: .infinity)
        }
    }
}


