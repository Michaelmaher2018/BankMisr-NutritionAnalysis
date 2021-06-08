import Foundation
import UIKit
import Alamofire

class Response_Handler: UIViewController {
    
    public func handleResponse<T:Codable>(response:Server_Response<T>?, error: Error?)->(data: T?, success: Bool){
        
        if let response = response {
            if let code = response.code {
                if code == 402 {
                    return(nil,false)
                }else if code == 422 {
                    if let message = response.message {
                        showError(with: message)
                    }
                    return (nil,false)
                }else if code == 401 {
                    showError(with: "You have to login")
                    return (nil,false)
                }else if code == 500 {
                    showError(with: "something wrong occurred, please try again")
                    return (nil,false)
                }else if let status = response.status {
                    if status == 1 {
                        if let data = response.data {
                            return (data,true)
                        }
                        else {
                            return (nil,true)
                        }
                    }else {
                        if let message = response.message {
                            showError(with: message)
                        }
                        return (nil,false)
                    }
                }
                
            }
        }else if let error = error{
            showError(with: error.localizedDescription)
            return (nil,false)
        }
        return (nil,false)
    }
    
    private func showError(with error: String) {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        var alert = UIAlertController()
        let ok = UIAlertAction(title: NSLocalizedString("ok", comment: "ok"), style: .default) { (action) in
        }
        alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        alert.addAction(ok)
        keyWindow.rootViewController!.present(alert,animated: true)
    }
}
