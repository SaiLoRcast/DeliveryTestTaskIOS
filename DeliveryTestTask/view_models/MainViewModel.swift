
import SwiftUI
import Combine

class MainViewModel: ObservableObject { 
    
    let client = UserClient()
    
    var stateView: StateView = StateView.loading {
        willSet {
            objectWillChange.send()
        }
    }
    
    var currentUser = UserInfo.emptyInit() {
        willSet {
            objectWillChange.send()
        }
    }
    
    var deliveryToUserUser = UserInfo.emptyInit() {
           willSet {
               objectWillChange.send()
           }
       }
        
    private var stateCurrenUser = StateView.loading
    
    private let userId = "0F8JIqi4zwvb77FGz6Wt"
    private let deliveryToAddress = "1Lkk06cOUCkiAsUXFLMN"

    init() {
        getData()
        getDataDeliveryTo()
    }
    
    func retry() {
        stateView = .loading
        stateCurrenUser = .loading
        
        getData()
        getDataDeliveryTo()
    }
    
    private func getData() {
        
        client.getCurrentUserInfo(at: userId) { [weak self] currentUserInfo, error in
            guard let ws = self else { return }
            if let currentUserInfo = currentUserInfo {
                ws.currentUser = currentUserInfo
                ws.stateCurrenUser = .success
                print("getData")
            } else {
                ws.stateCurrenUser = .failed
            }
        }
        
    }
    
    private func getDataDeliveryTo() {
         
         client.getDeliveryToAddress(at: deliveryToAddress) { [weak self] deliveryToUserUser, error in
                        guard let ws = self else { return }
                        if let deliveryToUserUser = deliveryToUserUser {
                            ws.deliveryToUserUser = deliveryToUserUser
                            ws.stateCurrenUser = .success
                            print("getData")
                        } else {
                            ws.stateCurrenUser = .failed
                        }
                    }
         
     }
    
}
