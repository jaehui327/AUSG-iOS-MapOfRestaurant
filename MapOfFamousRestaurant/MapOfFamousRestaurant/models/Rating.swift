//
//  Rating.swift
//  MapOfFamousRestaurant
//
//  Created by JHKim on 01/07/2019.
//  Copyright © 2019 JHKim. All rights reserved.
//

import Foundation

// 별점 응답 프로토콜
// GET /rating
struct RatingInformation: Codable {
    let rating: Double
}
