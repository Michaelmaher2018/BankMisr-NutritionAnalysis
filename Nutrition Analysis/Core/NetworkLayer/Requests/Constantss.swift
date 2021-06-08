
struct Constants {
    struct Server {
        static let baseURL = "https://api.edamam.com/api/"
        static let apiKey = "81bc0c208a56fb1fe28e8453d44e0d1b"
        static let appID = "86f27661"
    }
}

// MARK: - HTTPHeaderField
enum HTTPHeaderField: String {
    case Content_Type = "Content-Type"
    case Accept = "application/json"
}

// MARK: - ContentType
enum ContentType :String{
    case json = "application/json"
}

// MARK: - RequestMethod
enum RequestMethod: String {
    case GET
    case POST
}
