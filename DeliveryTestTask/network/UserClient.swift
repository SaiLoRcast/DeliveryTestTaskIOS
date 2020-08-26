
import Foundation

class UserClient {

    typealias CurrentUserInfoCompletionHandler = (UserInfo?, Error?) -> Void

    private let decoder = JSONDecoder()
    private let session: URLSession
        
    private func baseUrl(_ param: String) -> URL {
        return URL(string: "https://dummyapi.io/data/api/user/" + param)!
    }
        
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
        
    private func getBaseRequest<T: Codable>(at userId: String,
                                            completionHandler completion:  @escaping (_ object: T?,_ error: Error?) -> ()) {
        
        let url = baseUrl(userId)
        var request = URLRequest(url: url)
//        request.setValue("lo2EC3eWZjn1kkHHS3CB", forHTTPHeaderField:"app-id")
        request.setValue("5f46a4613655b000025d026c", forHTTPHeaderField:"app-id")

                
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        
                        completion(nil, ResponseError.requestFailed)
                        return
                    }
                    
                    print(httpResponse.statusCode)
    
                    if httpResponse.statusCode == 200 {
                        do {
                            let userInfo = try self.decoder.decode(T.self, from: data)
                            
                            completion(userInfo, nil)
                        } catch let error {
                            print(error)

                            completion(nil, error)
                        }
                    } else {
                        completion(nil, ResponseError.invalidData)
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
    
    func getCurrentUserInfo(at userId: String, completionHandler completion: @escaping CurrentUserInfoCompletionHandler) {
        getBaseRequest(at: userId) { (userInfo: UserInfo?, error) in
            completion(userInfo, error)
        }
        print("getCurrentUserInfo")
    }
    
    func getDeliveryToAddress(at userId: String, completionHandler completion: @escaping CurrentUserInfoCompletionHandler) {
          getBaseRequest(at: userId) { (userInfo: UserInfo?, error) in
              completion(userInfo, error)
          }
        print("getDeliveryToAddress")
      }
    
}
