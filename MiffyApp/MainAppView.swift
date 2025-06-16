import SwiftUI

struct MainAppView: View {
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            ContentView(isLoggedIn: $isLoggedIn) 
        } else {
            LoginView(isLoggedIn: $isLoggedIn) // Your login screen
        }
    }
}
