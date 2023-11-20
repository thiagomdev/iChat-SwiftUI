import SwiftUI

final class SignUpViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showModal: Bool = false
    
    func singUp() {
        print("Email: \(name)\nPassword: \(email)\nConfirm password: \(password)")
    }
}
