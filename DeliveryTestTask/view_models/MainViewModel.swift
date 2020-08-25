
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
    
    var currentDescription = "" {
        willSet {
            objectWillChange.send()
        }
    }
    
    private var stateCurrenUser = StateView.loading
    private var stateForecastWeather = StateView.loading
    
    private let userId = "0F8JIqi4zwvb77FGz6Wt"
    
    init() {
        getData()
    }
    
    func retry() {
        stateView = .loading
        stateCurrenUser = .loading
        stateForecastWeather = .loading
        
        getData()
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
            ws.updateStateView()
        }
        
    }
    
    private func updateStateView() {
        if stateCurrenUser == .success, stateForecastWeather == .success {
            stateView = .success
        }
        
        if stateCurrenUser == .failed, stateForecastWeather == .failed {
            stateView = .failed
        }
    }
}
