//
//  FormExampleView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

struct FormExampleView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var enableNotifications = true
    @State private var enableDarkMode = false
    @State private var selectedTheme = "Auto"
    @State private var sliderValue = 50.0
    @State private var selectedLanguage = "English"
    @State private var showingSuccessAlert = false

    let themes = ["Light", "Dark", "Auto"]
    let languages = ["English", "Spanish", "French", "German", "Japanese"]

    var isFormValid: Bool {
        !username.isEmpty &&
        !email.isEmpty &&
        email.contains("@") &&
        password.count >= 6
    }

    var body: some View {
        Form {
            Section {
                HStack(spacing: 12) {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Create Your Profile")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Fill in your details below")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8)
            }

            Section {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.blue)
                        .frame(width: 30)
                    TextField("Username", text: $username)
                        .textContentType(.username)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                }

                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.green)
                        .frame(width: 30)
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                }

                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.orange)
                        .frame(width: 30)
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                }

                if !password.isEmpty {
                    HStack {
                        Image(systemName: password.count >= 6 ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(password.count >= 6 ? .green : .red)
                        Text("Minimum 6 characters")
                            .font(.caption)
                            .foregroundColor(password.count >= 6 ? .green : .red)
                    }
                }
            } header: {
                Label("Account Information", systemImage: "person.text.rectangle")
            } footer: {
                Text("Your email will be used for account recovery")
                    .font(.caption)
            }

            Section {
                Toggle(isOn: $enableNotifications) {
                    HStack {
                        Image(systemName: "bell.badge")
                            .foregroundColor(.red)
                            .frame(width: 30)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Push Notifications")
                            Text("Receive updates and alerts")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Toggle(isOn: $enableDarkMode) {
                    HStack {
                        Image(systemName: "moon.fill")
                            .foregroundColor(.indigo)
                            .frame(width: 30)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Dark Mode")
                            Text("Easier on the eyes")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Picker(selection: $selectedTheme) {
                    ForEach(themes, id: \.self) { theme in
                        HStack {
                            Image(systemName: iconForTheme(theme))
                            Text(theme)
                        }
                        .tag(theme)
                    }
                } label: {
                    HStack {
                        Image(systemName: "paintbrush")
                            .foregroundColor(.purple)
                            .frame(width: 30)
                        Text("App Theme")
                    }
                }

                Picker(selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) { language in
                        Text(language).tag(language)
                    }
                } label: {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.cyan)
                            .frame(width: 30)
                        Text("Language")
                    }
                }
            } header: {
                Label("Preferences", systemImage: "slider.horizontal.3")
            }

            Section {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "speaker.wave.2")
                            .foregroundColor(.pink)
                        Text("Notification Volume")
                            .font(.headline)
                        Spacer()
                        Text("\(Int(sliderValue))%")
                            .font(.headline)
                            .foregroundColor(.pink)
                    }

                    Slider(value: $sliderValue, in: 0...100, step: 5)
                        .tint(.pink)

                    HStack {
                        Image(systemName: "speaker")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "speaker.wave.3")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            } header: {
                Label("Audio Settings", systemImage: "speaker.wave.2.fill")
            }

            Section {
                Button(action: {
                    showingSuccessAlert = true
                    print("Form submitted: \(username), \(email)")
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                        Text("Create Account")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }
                .disabled(!isFormValid)
                .foregroundColor(isFormValid ? .white : .gray)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isFormValid ? Color.blue.gradient : Color.gray.opacity(0.3))
                        .padding(.vertical, 4)
                )
            }
        }
        .navigationTitle("Form Example")
        .navigationBarTitleDisplayMode(.large)
        .alert("Success!", isPresented: $showingSuccessAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Account created successfully for \(username)!")
        }
    }

    private func iconForTheme(_ theme: String) -> String {
        switch theme {
        case "Light": return "sun.max.fill"
        case "Dark": return "moon.fill"
        case "Auto": return "circle.lefthalf.filled"
        default: return "paintbrush"
        }
    }
}

#Preview {
    NavigationView {
        FormExampleView()
    }
}
