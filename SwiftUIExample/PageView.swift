//
//  PageView.swift
//  SwiftUIExample
//
//  Created by qwerty on 21.02.2020.
//  Copyright © 2020 qwerty. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        PageViewController(controllers: viewControllers)
    }
}

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
                   .aspectRatio(3/2, contentMode: .fit)
    }
}
