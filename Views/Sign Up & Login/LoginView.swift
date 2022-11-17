//
//  LoginView.swift
//  Bank.io
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Private properties:
    
    /// Dismisses the view:
    @Environment (\.dismiss) private var dismiss
    
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
            .navigationTitle("Login")
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
            .animation(
                .default,
                value: viewModel.isLoginButtonDisabled
            )
            .animation(
                .default,
                value: viewModel.isLoading
            )
    }
}

// MARK: - Item:

private extension LoginView {
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

private extension LoginView {
    private var form: some View {
        Form {
            formContent
        }
    }
    
    @ViewBuilder
    private var formContent: some View {
        username
        password
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
}

// MARK: - Bottom toolbar:

private extension LoginView {
    private var bottomToolbar: some View {
        BottomToolbarView(
            isDividerShowing: true,
            backgroundColor: Color(.systemGroupedBackground)
        ) {
            toolbarContent
        }
    }
    
    @ViewBuilder
    private var toolbarContent: some View {
        loginButton
        signUpButton
    }
    
    private var loginButton: some View {
        ButtonView(
            title: "Login",
            isLoading: viewModel.isLoading,
            isDisabled: viewModel.isLoginButtonDisabled,
            action: viewModel.login
        )
    }
    
    private var signUpButton: some View {
        ButtonView(
            title: "Sing Up",
            color: .accentColor,
            verticalPadding: 0,
            horizontalPadding: 0,
            backgroundColor: .clear,
            cornerRadius: 0,
            isDisabled: viewModel.isLoading,
            action: dismiss.callAsFunction
        )
    }
}

// MARK: - Cancel toolbar:

private extension LoginView {
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

// MARK: - Preview:

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(dataService: DataService())
    }
}
