//
//  InitialView.swift
//  HelloSwift
//
//

import SwiftUI

struct InitialView: View {
    @State var swiftPressed = false
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Text("Hello Swift")
                    .font(.largeTitle)
                Text("Getting to Know You.")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1)))
                    .padding()
                Text("How comfortable are you programming in Swift? 👀📲")
                    .padding()
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.title2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 5)
                            .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1))))
                    .background(Color(#colorLiteral(red: 0.9313231959, green: 0.9313231959, blue: 0.9313231959, alpha: 1)))
                    .cornerRadius(25)
                VStack {
                    Text("Please choose:")
                        .font(.footnote)
                    HStack {
                        Image("swiftuiblue")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    .onTapGesture {
                        swiftPressed.toggle()
                        print(String(swiftPressed))
                        if swiftPressed {
                            
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 5)
                            .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1))))
                    .background(Color(#colorLiteral(red: 0.5688633549, green: 0.8755845413, blue: 0.9004192252, alpha: 1)))
                    .cornerRadius(25)
                    HStack {
                        Image("swiftuiblue")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        Image("swiftuiblue")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    .onTapGesture {
                        print("hell")
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 5)
                            .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1))))
                    .background(Color(#colorLiteral(red: 0.5688633549, green: 0.8755845413, blue: 0.9004192252, alpha: 1)))
                    .cornerRadius(25)

                    HStack {
                        Image("swiftuiblue")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        Image("swiftuiblue")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        Image("swiftuiblue")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }.onTapGesture {
                        print("he")
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 5)
                            .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1))))
                    .background(Color(#colorLiteral(red: 0.5688633549, green: 0.8755845413, blue: 0.9004192252, alpha: 1)))
                    .cornerRadius(25)
                }
                .padding()
                .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Spacer()
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
        InitialView()
            .previewDevice("iPhone SE (2nd generation)")
        InitialView()
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
}
