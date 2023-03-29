//
//  ContentView.swift
//  Furniture App
//
//  Created by Anthony Aniobi on 29/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                AppBarView()
                TagLineView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
