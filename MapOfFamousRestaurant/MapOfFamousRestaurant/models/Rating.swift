//
//  Rating.swift
//  MapOfFamousRestaurant
//
//  Created by JHKim on 01/07/2019.
//  Copyright © 2019 JHKim. All rights reserved.
//

import Foundation

// 별점 전송 프로토콜
// POST /rating
struct RatingInformation: Codable {
    let id: Int
    let rating: Double
    let locationId: Int
}
