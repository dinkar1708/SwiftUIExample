//
//  ViewLifeCycleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

struct ViewLifeCycleView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ViewLifeCycleViewDetailsView()) {
                    Text("Go To Food Menu")
                }
                Spacer()
                Text("Footer")
                    .onAppear {
                        print("ViewLifeCycleView Hi appear......")
                    }
                    .onDisappear {
                        print("ViewLifeCycleView HI dis appear......")
                    }
            }
        }
        .onAppear {
            print("ViewLifeCycleView appear......")
        }
        .onDisappear {
            print("ViewLifeCycleView dis appear......")
        }
    }
}

struct ViewLifeCycleViewDetailsView : View {
    var body: some View {
        VStack {
            Text("Pizza, Burger, Ice cream etc. ")
        }
        .onAppear {
            print("ViewLifeCycleViewDetailsView appear......")
        }.onDisappear {
            print("ViewLifeCycleViewDetailsView dis appear......")
        }
    }
}

struct ViewLifeCycleView_Previews: PreviewProvider {
    static var previews: some View {
        ViewLifeCycleView()
    }
}
