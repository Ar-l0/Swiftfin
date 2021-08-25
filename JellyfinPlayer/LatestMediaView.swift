/* JellyfinPlayer/Swiftfin is subject to the terms of the Mozilla Public
 * License, v2.0. If a copy of the MPL was not distributed with this
 * file, you can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * Copyright 2021 Aiden Vigue & Jellyfin Contributors
 */

import Stinsen
import SwiftUI

struct LatestMediaView: View {
    @EnvironmentObject var homeRouter: NavigationRouter<HomeCoordinator.Route>
    @StateObject var viewModel: LatestMediaViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.items, id: \.id) { item in
                    if item.type == "Series" || item.type == "Movie" {
                        Button {
                            homeRouter.route(to: .item(viewModel: .init(id: item.id!)))
                        } label: {
                            PortraitItemView(item: item)
                        }
                    }
                }.padding(.trailing, 16)
            }.padding(.leading, 20)
        }.frame(height: 200)
    }
}
