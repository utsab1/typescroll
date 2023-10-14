//
//  TypeWriterEffectViewModel.swift
//  typeScroll
//
//  Created by Utsab Aryal on 14/10/2023.
//

import Foundation

class TypeWriterEffectViewModel: ObservableObject {
    @Published var displayedText = ""
    @Published var isTyping = false
    
   
    func startTyping(responseText: String) {
        isTyping = true
        var currentIndex = 0
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if currentIndex < responseText.count {
                let index = responseText.index(responseText.startIndex, offsetBy: currentIndex)
                DispatchQueue.main.async {
                    
                    self.displayedText.append(responseText[index])
                  
                }
                currentIndex += 1
            } else {
                timer.invalidate()
                self.isTyping = false
            }
        }
    }
    
    func sendMessageToChatGPT(userMessage: String) {
        let apiKey = "" //Add your api key for chat gpt here
        
        let apiUrl = "https://api.openai.com/v1/chat/completions"

        let payload: [String: Any] = [
            "model": "gpt-3.5-turbo", // Specify the model you want to use
            "messages": [
               
                ["role": "user", "content": userMessage]
            ]
        ]

        if let jsonData = try? JSONSerialization.data(withJSONObject: payload) {
          
            var request = URLRequest(url: URL(string: apiUrl)!)
            request.httpMethod = "POST"
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
          
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data, let response = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    
                    print("Printed Data \(String(data: data, encoding: .utf8)!)")
                    if let replies = response["choices"] as? [[String: Any]], let reply = replies.first?["message"] as? [String: Any], let content = reply["content"] as? String {
                        print("Payload12")
                        print("Payload : \(content)")
                        // Update your UI with the chatbot's reply using the TypewriterEffectViewModel
                        DispatchQueue.main.async {
                            self.startTyping(responseText: content)
                        }
                    }
                } else if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }.resume()
        }
    }

}

