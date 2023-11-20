import SwiftUI

final class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showModal: Bool = false
    
    func singIn() {
        print("Email: \(email)\nPassword: \(password)")
    }
}
