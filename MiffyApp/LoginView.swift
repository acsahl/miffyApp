import SwiftUI

private extension Color {
    static let deepBlue = Color(red: 0/255, green: 85/255, blue: 152/255)
    static let moonYellow = Color(red: 254/255, green: 199/255, blue: 8/255)
    static let whiteOpacity = Color.white.opacity(0.1)
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool

    var body: some View {
        ZStack {
            Color.deepBlue.ignoresSafeArea()

            VStack(spacing: 24) {
                Image("miffylogo") 
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                Text("Welcome Back")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                VStack(spacing: 16) {
                    RoundedTextField("Username", text: $username)
                    RoundedSecureField("Password", text: $password)
                }

                Button(action: login) {
                    Text("Log In")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.moonYellow)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
            }
            .padding(32)
            .background(.ultraThinMaterial) // subtle blur for modern feel
            .cornerRadius(24)
            .padding()
        }
    }

    func login() {
        if username == "miffy" && password == "moon" {
            isLoggedIn = true
        } else {
            print("❌ Invalid login")
        }
    }
}

struct RoundedTextField: View {
    var placeholder: String
    @Binding var text: String

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(12)
            .foregroundColor(.white)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}

struct RoundedSecureField: View {
    var placeholder: String
    @Binding var text: String

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }

    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(12)
            .foregroundColor(.white)
    }
}
