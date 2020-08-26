
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
    
    var deliveryToUser = UserInfo.emptyInit() {
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
    
    private func getData() {
        print("getData")
        client.getCurrentUserInfo(at: userId) { [weak self] currentUserInfo, error in
            guard let ws = self else { return }
            if let currentUserInfo = currentUserInfo {
                ws.currentUser = currentUserInfo
                ws.stateCurrenUser = .success
                
            } else {
                ws.stateCurrenUser = .failed
            }
        }
        
    }
    
    private func getDataDeliveryTo() {
         print("getDataDeliveryTo")
         client.getDeliveryToAddress(at: deliveryToAddress) { [weak self] deliveryToUser, error in
                        guard let ws = self else { return }
                        if let deliveryToUser = deliveryToUser {
                            ws.deliveryToUser = deliveryToUser
                            ws.stateCurrenUser = .success
                        } else {
                            ws.stateCurrenUser = .failed
                        }
                    }
         
     }
    
}
