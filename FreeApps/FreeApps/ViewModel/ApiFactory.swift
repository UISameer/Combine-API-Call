import Foundation

final class ViewModelFactory {
    
    static func createViewModel() -> ViewModel {
        return ViewModel(manager: WebServiceManager())
    }
}

