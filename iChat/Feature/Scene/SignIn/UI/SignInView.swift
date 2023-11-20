import SwiftUI

struct SignInView: View {
    enum Layout {}
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
                    .cornerRadius(Layout.Dimentions.cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: Layout.Dimentions.cornerRadius)
                            .strokeBorder(Color(UIColor.separator),
                                          style: StrokeStyle(lineWidth: Layout.Dimentions.lineWidth))
                    )
                    .padding(.bottom)
                SecureField("Password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(Layout.Dimentions.cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: Layout.Dimentions.cornerRadius)
                            .strokeBorder(Color(UIColor.separator),
                             style: StrokeStyle(lineWidth: Layout.Dimentions.lineWidth))
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
                        .cornerRadius(Layout.Dimentions.cornerRadius)
                        .foregroundColor(.white)
                }
               
                Divider()
                    .padding([.top, .bottom], Layout.Padding.topAndBottom)
                Button {
                    viewModel.showModal.toggle()
                } label: {
                    Text("Don't have an account? SignUp here.")
                        .font(.subheadline).bold()
                        .foregroundColor(.black)
                }
                .padding(.bottom, Layout.Padding.bottom)
                .sheet(isPresented: $viewModel.showModal) {
                    SignUpView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, Layout.Padding.horizontal)
            .background(Color.init(red: 10/255, green: 100/255, blue: 100/255))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
