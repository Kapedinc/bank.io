//
//  SignUpView.swift
//  Bank.io
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - Private properties:
    
    /// Dismisses the view:
    @Environment (\.dismiss) private var dismiss
    
    /// Manager responsible for navigation within the app:
    @EnvironmentObject private var navigationManager: NavigationManager
    
    /// Service responsible for the data within the app:
    @EnvironmentObject private var dataService: DataService
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(dataService: DataService) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(dataService: dataService)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View:
    
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        NavigationStack {
            content
        }
    }
    
    private var content: some View {
        item
            .navigationTitle("Sign Up")
            .toolbar {
                cancelToolbar
            }
            .alert(
                "Something Went Wrong",
                isPresented: $viewModel.isErrorAlertPresented
            ) {
                
            } message: {
                Text("Please try again.")
            }
            .sheet(
                isPresented: $viewModel.isLoginPresented,
                content: login
            )
            .onChange(
                of: dataService.currentUser,
                perform: viewModel.currentUserOnChange
            )
            .animation(
                .default,
                value: viewModel.isSignUpButtonDisabled
            )
            .animation(
                .default,
                value: viewModel.isLoading
            )
    }
}

// MARK: - Item:

private extension SignUpView {
    private var item: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        form
        bottomToolbar
    }
}

// MARK: - Form:

private extension SignUpView {
    private var form: some View {
        Form {
            formContent
        }
    }
    
    @ViewBuilder
    private var formContent: some View {
        generalDetails
        address
    }
    
    private var generalDetails: some View {
        generalDetailsContent
            .headerProminence(.increased)
    }
    
    private var generalDetailsContent: some View {
        Section("General Details") {
            generalDetailsItem
        }
    }
    
    @ViewBuilder
    private var generalDetailsItem: some View {
        fullName
        username
        password
        confirmedPassword
    }
    
    private var fullName: some View {
        TextField(
            "Full Name",
            text: $viewModel.fullName
        )
    }
    
    private var username: some View {
        TextField(
            "Username",
            text: $viewModel.username
        )
    }
    
    private var password: some View {
        SecureField(
            "Password",
            text: $viewModel.password
        )
    }
    
    private var confirmedPassword: some View {
        SecureField(
            "Confirm Password",
            text: $viewModel.confirmedPassword
        )
    }
    
    private var address: some View {
        addressContent
            .headerProminence(.increased)
    }
    
    private var addressContent: some View {
        Section("Address") {
            addressItem
        }
    }
    
    @ViewBuilder
    private var addressItem: some View {
        firstLine
        secondLine
        city
        state
        zipCode
    }
    
    private var firstLine: some View {
        TextField(
            "First Line",
            text: $viewModel.firstLine
        )
    }
    
    private var secondLine: some View {
        TextField(
            "Second Line",
            text: $viewModel.secondLine
        )
    }
    
    private var city: some View {
        TextField(
            "City",
            text: $viewModel.city
        )
    }
    
    private var state: some View {
        TextField(
            "State",
            text: $viewModel.state
        )
    }
    
    private var zipCode: some View {
        TextField(
            "ZIP Code",
            text: $viewModel.zipCode
        )
    }
}

// MARK: - Bottom toolbar:

private extension SignUpView {
    private var bottomToolbar: some View {
        BottomToolbarView(
            isDividerShowing: true,
            backgroundColor: Color(.systemGroupedBackground)
        ) {
            bottomToolbarContent
        }
    }
    
    @ViewBuilder
    private var bottomToolbarContent: some View {
        legalNotice
        signUpButton
        loginButton
    }
    
    private var legalNotice: some View {
        Text("By signing up, I acknowledge that I have read and agree to the \(Text("[terms & conditions](https://www.appsources.io/terms-of-use)").underline().foregroundColor(.accentColor)).")
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .foregroundColor(.secondary)
    }
    
    private var signUpButton: some View {
        ButtonView(
            title: "Sign Up",
            isLoading: viewModel.isLoading,
            isDisabled: viewModel.isSignUpButtonDisabled,
            action: viewModel.signUp
        )
    }
    
    private var loginButton: some View {
        ButtonView(
            title: "Login",
            color: .accentColor,
            verticalPadding: 0,
            horizontalPadding: 0,
            backgroundColor: .clear,
            cornerRadius: 0,
            isDisabled: viewModel.isLoading,
            action: viewModel.login
        )
    }
}

// MARK: - Cancel toolbar:

private extension SignUpView {
    private var cancelToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            cancelButton
        }
    }
    
    private var cancelButton: some View {
        ButtonView(
            title: "Cancel",
            color: .accentColor,
            verticalPadding: 0,
            horizontalPadding: 0,
            isFullWidth: false,
            backgroundColor: .clear,
            cornerRadius: 0,
            action: dismiss.callAsFunction
        )
    }
}

// MARK: - Login:

private extension SignUpView {
    private func login() -> some View {
        LoginView(dataService: dataService)
            .environmentObject(dataService)
    }
}

// MARK: - Preview:

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(dataService: DataService())
            .environmentObject(NavigationManager())
            .environmentObject(DataService())
    }
}
