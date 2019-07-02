import Alamofire

struct LocationService {
    
    // 주소 등록하기
    // POST /locations
    func postLocationInformation(longitude: Double, latitude: Double, name: String, description: String, address: String, completionHandler: @escaping (LocationList) -> Void) {
        let params = ["longitude" : longitude,
                      "latitude" : latitude,
                      "name" : name,
                      "description" : description,
                      "address" : address] as [String : Any]
        Alamofire.request("\(SERVER_URL)/locations",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: nil).responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    do {
                        let locationList = try JSONDecoder().decode(LocationList.self, from: data)
                        completionHandler(locationList)
                    } catch {
                        print("Got and error: \(error)")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    // 모든 주소 가져오기
    // GET /locations
    func getLocationList(completionHandler: @escaping ([LocationList]) -> Void) {
        Alamofire.request("\(SERVER_URL)/locations",
            method: .get,
            parameters: nil,
            headers: nil).responseData{ dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    do {
                        let locationLists = try JSONDecoder().decode([LocationList].self, from: data)
                        completionHandler(locationLists)
                    } catch {
                        print("Got and error: \(error)")
                }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
}
