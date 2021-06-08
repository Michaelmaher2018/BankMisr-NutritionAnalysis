import Foundation
import UIKit
import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(decodedType: T.Type,
                                                    route: APIRouter,
                                                    decoder: JSONDecoder = JSONDecoder(),
                                                    completion: @escaping (T?, Error?) -> Void) -> DataRequest {

        AF.request(route).responseData { (response) in
            guard let requestResponse = response.response else{ return }
            if requestResponse.statusCode == 401 {
                completion(nil,nil)

                return
            }

            switch response.result {
            case .success(let value):
                //                print(JSON(value))
                do {
                    let DataResponsed = try JSONDecoder().decode(decodedType, from: value)
                    completion(DataResponsed,nil)

                } catch {
                    print("ERROR -> IN DECODE!!!!!!!")
                    print(error)
                    print(error.localizedDescription)
                    completion(nil,error)
                }

            case .failure(let error):
                print(error)
                completion(nil,error)
            }
        }
    }
    
    //MARK:- Home
    static func getNutritionDetails<T:Decodable>(decodedType: T.Type, values: [String], completion:@escaping (T?,Error?)->Void) {
        performRequest(decodedType: decodedType, route: APIRouter.nutritionDetails(values: values), completion: completion)
    }

}
