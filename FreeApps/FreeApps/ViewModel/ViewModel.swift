import Foundation
import Combine

class ViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    weak var webServiceManager: WebServiceManager?
    @Published var apps: [App] = []
    
    func getApps() {
        let appURL = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        self.webServiceManager?.getData(endpoint: appURL, type: AppsResponse.self)
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
