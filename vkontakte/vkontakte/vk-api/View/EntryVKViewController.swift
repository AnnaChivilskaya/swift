//
//  EntryVKViewController.swift
//  vkontakte
//
//  Created by Аня on 30.03.2022.
//

import UIKit
import WebKit

class EntryVKViewController: UIViewController, WKNavigationDelegate {
     
    @IBOutlet weak var WebView: WKWebView! {
    didSet {
        WebView.navigationDelegate = self
    }
}

@IBAction func unwindToVKLogin(_ segue: UIStoryboardSegue) {
    Model.auth.token = ""
    Model.auth.userID = 0
    let dataStore = WKWebsiteDataStore.default()
    dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
        records.forEach {
            if $0.displayName.contains("vkontakte") {
                dataStore.removeData(
                    ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
                    for: [$0]) { [weak self] in
                        guard
                            let self = self,
                            let url = self.urlComponents.url
                        else { return }
                        self.WebView.load(URLRequest(url: url))
                    }
            }
        }
    }
}

private var urlComponents: URLComponents = {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "oauth.vk.com"
    components.path = "/authorize"
    components.queryItems = [
        URLQueryItem(name: "client_id", value: "7822904"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "336918"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "v", value: "5.131"),
    ]
    return components
}()

override func viewDidLoad() {
    super.viewDidLoad()
    guard
        let url = urlComponents.url
    else { return }
    
    WebView.load(URLRequest(url: url))
}
}


extension AuthViewController: WKNavigationDelegate {
func webView(
    _ webView: WKWebView,
    decidePolicyFor navigationResponse: WKNavigationResponse,
    decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else { return decisionHandler(.allow) }
        
        let parameters = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { partialResult, params in
                var dictor = partialResult
                let key = params[0]
                let value = params[1]
                dictor[key] = value
                return dictor
            }
        guard
            let token = parameters["access_token"],
            let userIDString = parameters["user_id"],
            let userID = Int(userIDString)
        else { return decisionHandler(.allow) }
        
        Model.auth.token = token
        Model.auth.userID = userID
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "main") as? UITabBarController
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc ?? UIViewController(), animated: true, completion: nil)
        
        decisionHandler(.cancel)
}
}