import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: ViewModel = ViewModelFactory.createViewModel()
    @Environment(\.openURL) var openURL
    @State private var selectedApp: Applications = Applications.createEmptyApp()
    @State private var showDetailView: Bool = false

    var body: some View {
        
        List(viewModel.apps, id: \.id) { app in
            VStack(alignment: .leading) {
                
                HStack {
                    AsyncImage(url: URL(string: app.artworkUrl100), scale: 2)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(app.name)
                        Text(app.artistName)
                            .font(.caption)
                            .lineLimit(2)
                    }
                }
                
                HStack() {
                    Spacer()
                    Button {
                        openURL(URL(string: app.url)!)
                    } label: {
                        Image(systemName: "link")
                            .font(.subheadline)
                    }
                }
            }
            .onTapGesture {
                selectedApp = app
                showDetailView.toggle()
            }
        }.onAppear {
            viewModel.getApps()
        }.onDisappear(perform: {
            viewModel.cancelSubscription()
        })
        .navigationTitle("Free Apps")
        .sheet(isPresented: $showDetailView) {
            DetailView(viewModel: viewModel, selectedApp: $selectedApp, showDetailView: $showDetailView)
        }
    }
}

#Preview {
    HomeView()
}
