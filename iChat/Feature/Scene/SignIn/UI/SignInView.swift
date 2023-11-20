import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel: SignInViewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(.chatLogo)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24.0)
                            .strokeBorder(Color(UIColor.separator),
                             style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom)
                SecureField("Password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24.0)
                            .strokeBorder(Color(UIColor.separator),
                             style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom)

                Button {
                    viewModel.singIn()
                } label: {
                    Text("Sign In")
                        .font(.title3).bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(24.0)
                        .foregroundColor(.white)
                }
               
                Divider()
                    .padding([.top, .bottom], 130)
                Button {
                    viewModel.showModal.toggle()
                } label: {
                    Text("Don't have an account? SignUp here.")
                        .font(.subheadline).bold()
                        .foregroundColor(.black)
                }
                .padding(.bottom, 20)
                .sheet(isPresented: $viewModel.showModal) {
                    SignUpView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 10/255, green: 100/255, blue: 100/255))
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
