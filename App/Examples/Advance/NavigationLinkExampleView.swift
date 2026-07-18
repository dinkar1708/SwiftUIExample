//
//  NavigationLinkExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

struct NavigationLinkExampleView: View {
    var body: some View {
        // 1. root view need to be in navigation view
        NavigationView {
            ZStack {
                Color.yellow.ignoresSafeArea()
                // 2. define navigation link with destination view
                NavigationLink(destination: NavigationLinkExampleDetailsView()) {
                    // UI for navigation link
                    Text("inquiry of  HR Div. 経理・財務への問合せ窓口")
                }
            }
        }
    }
}

struct NavigationLinkExampleDetailsView : View {
    var body: some View {
        VStack {
            Text("経理・財務への問合せ窓口 経理財務への問合せ窓口です。お問合せ後は、担当者から直接ご本人へslackにてご連絡致しますのでお待ちください")
            TextField("氏名 / Full Name *", text: .constant(""))
            TextField("具体的なお問い合わせ内容 / Specific inquiry **", text: .constant(""))

            Spacer()
            // 3. one more navigation link
            NavigationLink(destination: NavigationLinkExampleCustomBackButtonView( onTapBackButton: {
                print("back button tapped......")
            })) {
                Text("Submit")
            }
            .padding()
            .background(Color.green)
        }
    }
}

struct NavigationLinkExampleCustomBackButtonView: View {
    // 4. use system Environment property
    @Environment(\.presentationMode) var presentation
    var onTapBackButton: () -> ()
    
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    // 6. cancel the navigation link ie. go back to previous screen
                    presentation.wrappedValue.dismiss()
                    onTapBackButton()
                }
                Spacer()
            }
            Spacer()
            Text("Thank you form is submitted successfully.")
            Spacer()
            // 5. hide the default navigation bar
            // hide default navigation bar
            .navigationBarHidden(true)
        }
        .padding()
    }
}

struct NavigationLinkExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkExampleView()
    }
}
