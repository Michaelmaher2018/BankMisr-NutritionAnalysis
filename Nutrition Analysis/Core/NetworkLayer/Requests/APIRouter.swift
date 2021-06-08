import UIKit
import Alamofire


enum APIRouter: URLRequestConvertible {
    //MARK:- Home
    case nutritionDetails(values: [String])
    case getProviderHomeApi
    
    //MARK:- HTTPMETHOD
    private var method : HTTPMethod {
        switch self {
        case .nutritionDetails, .getProviderHomeApi:
            return .post
        }
    }

    //MARK:- PATH
    private var path: String {
        switch self {
        case .nutritionDetails:
            return "nutrition-details"
        case .getProviderHomeApi:
            return "store/home"
        }

    }

    //MARK:- ENCODING
    internal var encoding: ParameterEncoding {
        switch method {
        case .post, .put:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }

    //MARK:- ENCODING
    private var parameters: [String:Any]? {
        switch self {
        case .nutritionDetails(values: let values):
            return ["ingr": values]
        case .getProviderHomeApi:
            return ["field": "",
                    "user_type": "vendor"]
        }

    }

    func asURLRequest() throws -> URLRequest {
        let url = "https://api.edamam.com/api/"
        let queryParams = "app_id=\(Constants.appId.rawValue)&app_key=\(Constants.appKey.rawValue)"
        var urlRequest = URLRequest(url: URL(string: "\(url)\(path)?\(queryParams)")!)
        //HTTP METHOD
        urlRequest.httpMethod = method.rawValue

        //HEADER
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

        //        PARAMETERS
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch{
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        //DEBUG DESCRIPTION
        print("Headers \(urlRequest.allHTTPHeaderFields)")
        print("Request URL \(urlRequest.url)")
        print("Parameters \(parameters)")
        print("Method \(urlRequest.httpMethod)")

        return try! encoding.encode(urlRequest, with: parameters)
    }
}
