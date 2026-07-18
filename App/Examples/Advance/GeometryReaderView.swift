//
//  GeometryReaderView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/13.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        HStack {
            GeometryReader { geometry in
                // width automatically use the screen width
                HStack(spacing: 10) {
                    VStack (spacing: 200) {
                        Text("Portal")
                        Text("Home")
                        Text("会社からのお知らせ")
                    }
                    // 30% of outer view width
                    .frame(width: geometry.size.width * 0.30)
                    .background(Color.gray)
                    HStack {
                        VStack(spacing: 210) {
                            Text("会社からのお知らせ")
                            Text("FAQ ranking")
                            Text("このポータルサイトについて")
                        }
                    }
                    // 70% width
                    .frame(width: geometry.size.width * 0.70)
                    .background(Color.pink)
                }
                Spacer()
            }
        }
        .background(Color.yellow)
        // without frame use all width / screen width
        // width used by GeometryReader
    }
}

struct GeometryReaderView1: View {
    var body: some View {
        HStack {
            // 2. works based on parent width
            GeometryReader { geometry in
                // 3. use geometry for available values
                HStack(spacing: 0) {
                    Text("Hi....... Hello.............Hi..... Long text....... Bigger .... More bigger.....")
                    // 50% of outer view width
                        .frame(width: geometry.size.width * 0.50)
                    
                    Button("Like Yes?") {}
                    // 25% of outer view width
                        .frame(width: geometry.size.width * 0.35)
                    
                    Button("Like No?") {}
                    // 25% of outer view width
                        .frame(width: geometry.size.width * 0.15)
                }
                .background(Color.gray)
            }
            // 1. fix the width
            .frame(width: 300)
            Button("Remaining area...........") {}
        }
        .background(Color.yellow)
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView1()
    }
}
