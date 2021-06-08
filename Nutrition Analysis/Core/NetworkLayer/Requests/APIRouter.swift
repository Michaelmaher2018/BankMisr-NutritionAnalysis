import UIKit
import Alamofire


enum APIRouter: URLRequestConvertible {

    case nutritionDetails(value: String)
    
    //MARK:- HTTPMETHOD
    private var method : HTTPMethod {
        switch self {
        case .nutritionDetails:
            return .get
        }
    }

    //MARK:- PATH
    private var path: String {
        switch self {
        case .nutritionDetails:
            return "nutrition-data"
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
    private var parameters: [String: Any]? {
        switch self {
        case .nutritionDetails(value: let value):
            return ["ingr": value]
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        
        let ingr = (parameters?.first?.value) as? String
        let ingrPath = "&ingr=\(ingr ?? "")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let queryParams = "app_id=\(Constants.appID)&app_key=\(Constants.apiKey)" + ingrPath
        var urlRequest = URLRequest(url: URL(string: "\(url)\(path)?\(queryParams)")!)
        //HTTP METHOD
        urlRequest.httpMethod = method.rawValue

        //HEADER
        urlRequest.addValue(Constants.application_json, forHTTPHeaderField: Constants.contentType)
        urlRequest.addValue(Constants.application_json, forHTTPHeaderField: "Accept")

        //DEBUG DESCRIPTION
        debugPrint("Method:\(urlRequest.httpMethod ?? "") | Request URL \(urlRequest.url?.description ?? "") | ingr:\(ingr ?? "")")
        return try! encoding.encode(urlRequest, with: nil)
    }
}
