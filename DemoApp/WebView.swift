//
//  WebKitVw.swift
//  DemoApp
//
//  Created by Raman Mann on 24/08/24.
//

import SwiftUI
import WebKit


struct WebViewPreview: View {
    @Environment(\.dismiss) var dismiss
    var urlString: URL?
    var title : String
    var body: some View {
        WebView(urlString: urlString)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: Button(action: {
                // Custom back action
                dismiss()
            }) {
                Image(systemName: "chevron.left") // Custom back button image
                    .imageScale(.medium)
                    .foregroundColor(.black)
            })
    }
}

#Preview {
    WebViewPreview( title: "WebView")
}

 
#Preview {
    WebView(urlString: URL(string: "https://www.google.com"))
}


struct WebView: UIViewRepresentable {
    let urlString: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = urlString {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
