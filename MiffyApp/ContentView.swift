import SwiftUI

private extension Color {
    static let deepBlue = Color(red: 0/255, green: 85/255, blue: 152/255)
    static let moonYellow = Color(red: 254/255, green: 199/255, blue: 8/255)
    static let sage = Color(red: 160/255, green: 160/255, blue: 131/255)
    static let battleshipGray = Color(red: 121/255, green: 132/255, blue: 120/255)
    static let paynesGray = Color(red: 77/255, green: 106/255, blue: 109/255)
}

struct ContentView: View {
    
    let imageNames = ["miffy", "miffy2", "miffy3"]
    @State private var currentPage: Int = 0
    @Binding var isLoggedIn: Bool
    var body: some View {

        ZStack {
            Color.deepBlue.ignoresSafeArea()

            VStack {

                ZStack {
                    TabView(selection: $currentPage) {
                        ForEach(imageNames.indices, id: \.self) { idx in
                            VStack {
                                Image(imageNames[idx])
                                    .resizable()
                                    .cornerRadius(15)
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                Text(imageNames[idx].capitalized)
                                    .font(.title).foregroundColor(.sage)
                            }
                            .tag(idx)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .indexViewStyle(.page(backgroundDisplayMode: .never))
                }
                .frame(height: 400)

                // Custom page indicator
                HStack(spacing: 8) {
                    ForEach(imageNames.indices, id: \.self) { idx in
                        Circle()
                            .fill(idx == currentPage ? Color.paynesGray : Color.sage)
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top, 8)
                
            }
            .padding()
            
            
            VStack {
                HStack {
                    Spacer()
                    Button("Logout") {
                        isLoggedIn = false
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color.moonYellow)
                    .cornerRadius(10)
                }
                Spacer()
            }
            .padding(.top, 40) // adjust this if it's under the status bar
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    ContentView(isLoggedIn: .constant(true))
}
