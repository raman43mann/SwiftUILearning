import SwiftUI

struct SettingsView: View {
    @State private var toggleOn = false
    @State private var logout = false
    @State private var delete = false
    @State private var progress = 0.5
    var body: some View {
        
            Form {
                ProfileSettingSection(toggleOn: $toggleOn)
                
                LeagalViewSection()
                
                AccountActionSection(delete: $delete, logout: $logout)
              
                
                Gauge(value: progress, in: 0...1) {
                    Text("Speed")
                } currentValueLabel: {
                    Text("\(Int(progress * 100))%")
                }
                .gaugeStyle(.accessoryCircular)
                .padding()
            }
       
    }
}


#Preview {
    SettingsView()

}


struct ProfileSettingSection:View{
    @Binding var toggleOn: Bool
    var body: some View {
        Section{
            ZStack{
                Text("Profile")
                NavigationLink(destination: Profile()) {
                    EmptyView()
                }.frame(width: 0)
                    .opacity(0.0)
            }
            
            ZStack{
                Text("Change Password")
                NavigationLink(destination: ChangePassword()) {
                    EmptyView()
                }.frame(width: 0)
                    .opacity(0.0)
            }
            HStack {
                Text("Notification On/Off")
                Spacer()
                Toggle(isOn: $toggleOn, label: {
                    Text("")
                })
                .onChange(of: toggleOn) {
                    print(toggleOn ? "On" : "Off")
                }
            }
        }
    }
}


struct LeagalViewSection :View{
    var body : some View{
        Section {
            LeagalViewPreview(title: "Terms & Conditions", link: URL(string: "https://www.google.com"))
            LeagalViewPreview(title: "Privacy Policy", link: URL(string: "https://www.google.com"))
            LeagalViewPreview(title: "Help", link: URL(string: "https://www.google.com"))
            LeagalViewPreview(title: "About Us", link: URL(string: "https://www.google.com"))
        }
    }
}


struct AccountActionSection:View{
    @Binding var delete: Bool
    @Binding var logout: Bool
    var body: some View{
        Section {
            Group {
                Text("Delete Account")
                    .padding(.horizontal,0)
                    .onTapGesture {
                        delete.toggle()
                    }
                    .alert(isPresented: $delete) {
                        Alert(
                            title: Text("Delete ⚠️"),
                            message: Text("Are you sure you want to delete your account?"),
                            primaryButton: .default(Text("Yes")),
                            secondaryButton: .destructive(Text("No"))
                        )
                    }
                Text("Logout")
                    .padding(.horizontal,0)
                    .onTapGesture {
                        logout.toggle()
                    }
                    .alert(isPresented: $logout) {
                        Alert(
                            title: Text("Logout"),
                            message: Text("Are you sure you want to logout of the current session?"),
                            primaryButton: .default(Text("Yes")),
                            secondaryButton: .destructive(Text("No"))
                        )
                    }
            }
            .fontWeight(.medium)
            .font(.system(size: 20))
            .foregroundColor(.red)
            .padding(.vertical, 5)
            
        }
    }
}

struct LeagalViewPreview: View {
    var title : String
    var link: URL?
    var body: some View {
        ZStack{
            Text(title).padding(.horizontal,0)
            NavigationLink(destination: WebViewPreview(urlString: link, title: title)) {
                EmptyView()
            }.frame(width: 0)
                .opacity(0.0)
        }
    }
}
