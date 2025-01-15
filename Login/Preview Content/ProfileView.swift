import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @State private var userEmail: String = Auth.auth().currentUser?.email ?? "Usuário"
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)

            Text(userEmail)
                .font(.headline)

            Button(action: logout) {
                Text("Sair")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
        } catch {
            print("Erro ao sair: \(error.localizedDescription)")
        }
    }
}
