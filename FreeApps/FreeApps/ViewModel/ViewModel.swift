import Foundation
import Combine

class ViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    private let webServiceManager: WebServiceProtocol
    @Published var apps: [Applications] = []
    
    
    init(manager: WebServiceProtocol) {
        self.webServiceManager = manager
    }
    
    deinit {
        cancelSubscription()
    }
    
    func cancelSubscription() {
        cancellable.forEach{ $0.cancel() }
    }
    
    func getApps() {
        self.webServiceManager.getData(endpoint: Constants.url, type: AppsResponse.self)
            .sink { result in
                switch result {
                    case .failure(let err):
                        print("Error is \(err.localizedDescription)")
                    case .finished:
                        print("Finished")
                }
            } receiveValue: { [weak self] appsResponse in
                self?.apps = appsResponse.feed.results
            }.store(in: &cancellable)
    }
}
