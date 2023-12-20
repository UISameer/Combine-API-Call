import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: ViewModel
    @Binding var selectedApp: Applications
    @Binding var showDetailView: Bool
    
    var body: some View {
        TextField("Task name", text: $selectedApp.name)
    }
}

#Preview {
    DetailView(viewModel: ViewModelFactory.createViewModel(), selectedApp: .constant(Applications.createEmptyApp()), showDetailView: .constant(false))
}
