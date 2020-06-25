//===----------------------------------------------------------------------===//
//
// This source file is part of the website-backend open source project
//
// Copyright © 2020 Netbot Ltd. and the website-backend project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import Vapor
import Fluent

class WebLink: Model {

    static var schema: String = "web_links"

    // MARK: Properties
    @ID()
    var id: UUID?

    @Field(key: FieldKeys.url.rawValue)
    var url: String

    // MARK: Relations
    @Parent(key: FieldKeys.user.rawValue)
    var user: User

    @Siblings(through: WebLinkSocialMediaSiblings.self, from: \.$webLink, to: \.$socialMedia)
    var socialMedias: [SocialMedia]

    // MARK: Initializer
    required init() {}

    init(id: WebLink.IDValue? = nil, userId: User.IDValue, url: String) {
        self.id = id
        self.$user.id = userId
        self.url = url
    }
}

// MARK: Field keys
extension WebLink {

    enum FieldKeys: FieldKey {
        case user = "user_id"
        case url
    }
}
