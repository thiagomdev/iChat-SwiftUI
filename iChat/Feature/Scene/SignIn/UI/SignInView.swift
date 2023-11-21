import SwiftUI

struct SignInView: View {
    enum Layout {}
    @StateObject private var viewModel: SignInViewModel = SignInViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Spacer()
                Image(.chatLogo)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                TextField(Layout.Strings.emailPlaceholder, text: $viewModel.email)
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
                SecureField(Layout.Strings.passwordPlaceholder, text: $viewModel.password)
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
                    Text(Layout.Strings.signIn)
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
                    Text(Layout.Strings.dontHaveAnAccount)
                        .font(.subheadline).bold()
                        .foregroundColor(.black)
                }
                .padding(.vertical, Layout.Padding.bottom)
                .sheet(isPresented: $viewModel.showModal) {
                    SignUpView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, Layout.Padding.horizontal)
        .background(Color.init(red: 10/255, green: 100/255, blue: 100/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
