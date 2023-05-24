//
//  SwiftUIView.swift
//  SwiftUI with Storyboards
//
//  Created by John Doll on 11/1/22.
//

import SwiftUI

class SwiftUIViewHostingController_SwiftUIView: UIHostingController<SwiftUIView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUIView())
    }
}

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
