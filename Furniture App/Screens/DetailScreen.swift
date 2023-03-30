//
//  DetailScreen.swift
//  Furniture App
//
//  Created by Anthony Aniobi on 30/03/2023.
//

import SwiftUI

struct DetailScreen: View {
    @Binding var goBack:Bool
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView (.vertical, showsIndicators: false){
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                DescriptionView()
                    .offset(y:-40)
            }
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Button(action:{}){
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10.0)
                }
            }.padding()
                .background(Color("Primary"))
                .cornerRadius(50, corners: .topLeft)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }.edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButtonView(action: {goBack = true}), trailing: Image("threeDot")
            )
            
            
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Luxry Swedian \nChair")
                .font(.title)
                .fontWeight(.bold)
            HStack( spacing: 4){
                ForEach(0..<5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(0.8)
                .opacity(0.6)
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 120cm")
                        .opacity(0.6)
                    Text("Width: 80cm")
                        .opacity(0.6)
                    Text("Diameter: 72cm")
                        .opacity(0.6)
                }.frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Jati Wood, Canvas \nAmazing love")
                        .opacity(0.6)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.vertical)
            
            HStack{
                VStack(alignment:.leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                Spacer()
                VStack(alignment:.leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack{
                        Button(action: {}){
                            Image(systemName: "minus")
                                .frame(width: 30, height:30)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                .foregroundColor(.black)
                        }
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        Button(action: {}){
                            Image(systemName: "plus")
                                .frame(width: 30, height:30)
                                .background(Color("Primary"))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }.padding()
            .padding(.top)
            .background(Color("Bg"))
            .cornerRadius(40.0)
        
        
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

//struct DetailScreen_Previews: PreviewProvider {
//    let backer:Bool = false
//    static var previews: some View {
//        DetailScreen(goBack: backer)
//    }
//}

struct CustomBackButtonView: View {
    let action: ()->Void
    var body: some View {
        Button(action: action){
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(.white)
                .cornerRadius(8)
        }
    }
}
