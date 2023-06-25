import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @ObservedObject var localizationManager = LocalizationManager.shared
    @StateObject var user = UserAuthentication()


    var body: some View {
        VStack(alignment: .leading) {
            // username - Mannually
            TextField("Enter your name", text: $user.username)
                .padding()
                .border(Color.gray, width: 0.5)
            Text("Your username is: \(user.username)")
            
            // published - @Published
            TextField("Enter published", text: $user.published)
                .padding()
                .border(Color.gray, width: 0.5)
            Text("Your username is: \(user.published)")
            
            // non_published
            TextField("Enter non_published", text: $user.non_published)
                .padding()
                .border(Color.gray, width: 0.5)
            Text("Your username is: \(user.non_published)")
        }
        
        
        VStack {
            TextField(localizationManager.localizedString("trial - Enter question number"), text: $viewModel.questionNumber)
                .font(.title)
                .padding()
                .border(Color.gray, width: 0.5)
            
            
            VStack {
                Text(localizationManager.localizedString("WFD question type"))
                    .font(.largeTitle)
                    .padding(.bottom, 50)

                Text(viewModel.resultText)
                    .padding()
                    .font(.body)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 10)
            
                Button(action: {
                    viewModel.makeGetRequest()
                    
                    
                }) {
                    Text(localizationManager.localizedString("Get answer"))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 50)
                
                Button(action: {
                    localizationManager.switchLanguage()
                }) {
                    Text(localizationManager.localizedString("Change Language"))
                }
                .padding(.top, 20)
            }
        }
    }
}

