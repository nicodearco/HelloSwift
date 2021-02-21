//
//  ThemeListView.swift
//  HelloSwift
//
//

import SwiftUI

struct ThemeListView: View {
    
    @State var chevronTapped = false
    
    var body: some View {
        if chevronTapped {
            GridView()
                .animation(.spring())
        } else {
            NavigationView {
                List(0..<swiftLearningThemes.count) { theme in
                    if theme % 2 == 0 {
                        HStack {
                            Text(swiftLearningThemes[theme])
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.forward.square")
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7315282822, blue: 0.8660855293, alpha: 1)))
                                .font(.title)

                        }
                        .padding()
                        .onTapGesture {
                            withAnimation {
                                chevronTapped = true
                            }
                        }
                    } else {
                        HStack {
                            Text(swiftLearningThemes[theme])
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.forward.square.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6022030094, blue: 0.716258733, alpha: 1)))
                                .font(.title)
                        }
                        .padding()
                        .onTapGesture {
                            withAnimation {
                                chevronTapped = true
                            }
                        }
                    }
                }
                .navigationTitle("Key SwiftUI Themes")
            }
        }
    }
}

struct ThemeListView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeListView()
        ThemeListView()
            .previewDevice("iPhone SE (2nd generation)")
        ThemeListView()
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
}
