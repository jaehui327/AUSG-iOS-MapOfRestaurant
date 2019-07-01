//
//  RatingNetworkModel.swift
//  MapOfFamousRestaurant
//
//  Created by JHKim on 01/07/2019.
//  Copyright © 2019 JHKim. All rights reserved.
//

import Alamofire

struct RatingService {
    
    // 별점 등록하기
    // POST /rating
    func postRatingInformation(rating: Double, locationId: Int, completionHandler: @escaping (RatingInformation) -> Void) {
        let params = ["rating" : rating,
                      "locationId" : locationId] as [String : Any]
        Alamofire.request("\(SERVER_URL)/ratings",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: nil).responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    do {
                        let ratingInformation = try JSONDecoder().decode(RatingInformation.self, from: data)
                        completionHandler(ratingInformation)
                    } catch {
                        print("Got and error: \(error)")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    // 별점 가져오기
    // GET /rating
    func getRatingInformation(id: Int, completionHandler: @escaping (RatingInformation) -> Void) {
        let params = ["id" : id]
        Alamofire.request("\(SERVER_URL)/ratings",
            method: .get,
            parameters: params,
            headers: nil).responseData{ dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    do {
                        let ratingInformation = try JSONDecoder().decode(RatingInformation.self, from: data)
                        completionHandler(ratingInformation)
                    } catch {
                        print("Got and error: \(error)")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
}
