import Foundation
struct Server_Response <T: Decodable>: Decodable {
    let status : Int?
    let code : Int?
    let message : String?
	let data : T?

	enum CodingKeys: String, CodingKey {

		case status = "Status"
		case code = "Code"
        case message = "Message"
		case data = "Data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(T.self, forKey: .data)

	}

}
