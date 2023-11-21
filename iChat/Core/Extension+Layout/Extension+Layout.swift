import SwiftUI

extension SignInView.Layout {
    enum Dimentions {
        static var cornerRadius: CGFloat = 24.0
        static var lineWidth: CGFloat = 1.0
    }
    
    enum Padding {
        static var bottom: CGFloat = 80.0
        static var topAndBottom: CGFloat = 130.0
        static var horizontal: CGFloat = 32.0
    }
    
    enum Strings {
        static var emailPlaceholder: String = "Email"
        static var passwordPlaceholder: String = "Password"
        static var signIn: String = "Sign In"
        static var dontHaveAnAccount: String = "Don't have an account? SignUp here."
    }
}
