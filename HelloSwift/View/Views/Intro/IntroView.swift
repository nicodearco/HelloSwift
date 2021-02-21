//
//  IntroView.swift
//  HelloSwift
//
//

import SwiftUI

struct IntroView: View {
    @State var continuePressed = false
    @State var hasTimeElapsed = false
    @State var hasTimeElapsedButton = false
    @State var buttonPressed = false
    func delay(nums: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + nums) {
            withAnimation {
                hasTimeElapsed = true
            }
        }
    }
    func delayButton(nums: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + nums) {
            withAnimation {
                hasTimeElapsedButton = true
            }
        }
    }
    var body: some View {
        VStack {
            if buttonPressed {
                SecondView()
                    .animation(.spring())
                    .transition(.move(edge: .trailing))
            } else {
                Text(hasTimeElapsed ? "HelloSwift" : "")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                    .onAppear(perform: {
                        delay(nums: 1)
                    })
                Text(hasTimeElapsedButton ? "Continue" : "")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .onAppear(perform: {
                        delayButton(nums: 3)
                    })
                    .onTapGesture {
                        withAnimation {
                            buttonPressed.toggle()
                        }
                    }
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .preferredColorScheme(.dark)
//            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
}

struct SecondView: View {
    
    @State var firstChoice = false
    @State var secondChoice = false
    @State var thirdChoice = false
    @State var submitPressed = false
    
    var body: some View {
        if submitPressed {
            ThemeListView()
                .animation(.spring())
                .transition(.move(edge: .trailing))
        } else {
            ScrollView {
                VStack {
                    Text("HelloSwift")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                    Text("How comfortable are you with SwiftUI? 👀")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .padding()
                        .multilineTextAlignment(.center)
                    Spacer()
                    VStack(alignment: .center) {
                        HStack {
                          Image("swiftuiblue")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding()
                        }
                        .padding()
                        .background(
                            Color(firstChoice ? #colorLiteral(red: 0, green: 0.7315282822, blue: 0.8660855293, alpha: 1) : .clear).cornerRadius(20)
                        )
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 7).foregroundColor(Color(#colorLiteral(red: 0, green: 0.6022030094, blue: 0.716258733, alpha: 1))))
                        .onTapGesture {
                            withAnimation {
                                thirdChoice = false
                                firstChoice = true
                                secondChoice = false
                            }
                        }
                        .padding()
                        HStack {
                            Image("swiftuiblue")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding()
                            Image("swiftuiblue")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding()
                        }
                        .padding()
                        .background(
                            Color(secondChoice ? #colorLiteral(red: 0, green: 0.7315282822, blue: 0.8660855293, alpha: 1) : .clear).cornerRadius(20)
                        )
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 7).foregroundColor(Color(#colorLiteral(red: 0, green: 0.6022030094, blue: 0.716258733, alpha: 1))))
                        .onTapGesture {
                            withAnimation {
                                thirdChoice = false
                                firstChoice = false
                                secondChoice = true
                            }
                        }
                        .padding()
                        HStack {
                            Image("swiftuiblue")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding()
                            Image("swiftuiblue")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding()
                            Image("swiftuiblue")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding()
                        }
                        .padding()
                        .background(
                            Color(thirdChoice ? #colorLiteral(red: 0, green: 0.7315282822, blue: 0.8660855293, alpha: 1) : .clear).cornerRadius(20)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 7).foregroundColor(Color(#colorLiteral(red: 0, green: 0.6022030094, blue: 0.716258733, alpha: 1)))
                        )
                        .onTapGesture {
                            withAnimation {
                                thirdChoice = true
                                firstChoice = false
                                secondChoice = false
                            }
                        }
                        .padding()
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            submitPressed = true
                        }
                    } label: {
                        Text("Submit")
                            .font(.title)
                            .bold()
                    }
                }
                .padding()
            }
        }
        
    }

    
}
