//
//  ViewBuilderTipsView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/15.
//

import SwiftUI

enum Direction {
    case left, right
}

// this case need to wrap in any view ... not cool....
func getDirectionView(direction: Direction) -> some View {
    if direction == .left {
        return AnyView(Text("Thought Leadership -> Expert Insights -> All   Health, Wellness & Life Science  Mobility, Transport & Logistics Smart Places  Wholesale, Retail, e-Commerce & FMCG Consultancy Data Experience Technology Strategy"))
    } else {
        return AnyView(EmptyView())
    }
}

// flexibility to return any kind of view without casting... looks cool
// AnyView not need - kaku hitsyu nai desu
@ViewBuilder
func getDirectionView1(direction: Direction) -> some View {
    if direction == .left {
        Text("Putting People at the Heart of Smart Places Development -> Keeping customer experience at the forefront of your decision making is key to developing Smart Places. From construction companies to building management firms to local governments, all those involved in developing Smart Places have the opportunity to use the latest technologies to provide a greater digital experience and quality of life for their customers.")
    } else {
        EmptyView()
    }
}

struct ViewBuilderTipsView: View {
    var body: some View {
        VStack {
            // use
            getDirectionView(direction: .left)
                .padding(.top)
                .padding(.bottom)
            // use using ViewBuilder
            getDirectionView1(direction: .left)
        }
    }
}

struct ViewBuilderTipsView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderTipsView()
    }
}
