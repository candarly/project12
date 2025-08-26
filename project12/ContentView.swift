import SwiftUI

struct ContentView: View {
    @State private var goToAuthView: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                if goToAuthView {
                    AuthView(goToAuthView: $goToAuthView).transition(.move(edge: .trailing))
                } else {
                    HelloView(goToAuthView: $goToAuthView).transition(.move(edge: .leading))
                }
            }
        }.animation(.easeInOut(duration: 0.5), value: goToAuthView)
    }
}

struct HelloView: View {
    @Binding var goToAuthView: Bool
    var body: some View {
        VStack {
            Spacer()
            VStack{
                ToDoListIconView().offset(y: -30)
                Text("Welcome to ToDo!")
                    .font(Font.custom(.Ubuntu, size: 30))
                    .foregroundColor(.accentColor)
                    .bold()
                Text("ToDo - application for managing tasks")
                    .font(Font.custom(.Ubuntu, size: 18))
                    .foregroundStyle(.grayFont)
                    .padding(.horizontal, 30)
                    .padding(.top, 2)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
            }
            Spacer()
            Button(action:{
                goToAuthView = true
            }) {
                RoundedRectangle(cornerRadius: 10).fill(Color.accent)
                    .frame(height: 60)
                    .overlay{
                        Text("Next")
                            .font(Font.custom(.Ubuntu, size: 18))
                            .foregroundStyle(.white)
                            .bold()
                    }.padding(.horizontal, 20)
            }.offset(y: -20)
        }
        
    }
}

struct AuthView: View {
    @State private var number: String = ""
    @Binding var goToAuthView: Bool
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 0){
                Text("Authorization")
                    .font(Font.custom(.Ubuntu, size: 40))       .foregroundColor(.accentColor)
                    .bold()
                Text("You need to enter your number to continue")
                    .font(Font.custom(.Ubuntu, size: 16))
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 30)
                    .padding(.top, 8)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 30)
                HStack(spacing: 0){
                    Text("+7")
                        .font(Font.custom(.Ubuntu, size: 20))
                        .frame(width: 60, height: 60)
                    TextField("input your number", text: $number)
                        .font(Font.custom(.Ubuntu, size: 16))
                        .frame(height: 60)
                }
                    .overlay{
                        RoundedRectangle(cornerRadius: 10.0)
                            .strokeBorder(Color.gray)
                    }
                    .padding(.horizontal, 20)
            }
            Spacer()
            
            if ValidationNumber.isNumberValid(number){
                Button(action:{

                }) {
                    RoundedRectangle(cornerRadius: 10).fill(Color.accentColor)
                        .frame(height: 60)
                        .overlay{
                            Text("Sign In")
                                .font(Font.custom(.Ubuntu, size: 18))
                                .foregroundStyle(.white)
                                .bold()
                        }.padding(.horizontal, 20)
                }.offset(y: -20)
            } else {
                Button(action:{
                    withAnimation{
                        goToAuthView = true
                        }
                }) {
                    RoundedRectangle(cornerRadius: 10).fill(Color.grayFont)
                        .frame(height: 60)
                        .overlay{
                            Text("Sign In")
                                .font(Font.custom(.Ubuntu, size: 18))
                                .foregroundStyle(.white)
                                .bold()
                        }.padding(.horizontal, 20)
                }.offset(y: -20)
            }
        }
    }
}


#Preview {
    ContentView()
}
