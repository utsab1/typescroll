//
//  TypeWriterEffectView.swift
//  typeScroll
//
//  Created by Utsab Aryal on 14/10/2023.
//

import SwiftUI

struct TypeWriterEffectView: View {
    @ObservedObject private var viewModel = TypeWriterEffectViewModel()
    let responseText: String
    @State private var isLoading = false
   
    init(responseText: String) {
        self.responseText = responseText
    }
    
    var body: some View {
                    VStack {
                        Text("Typewriter With Auto-Scroll")
                            .font(.title)
                            .padding()
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                ScrollViewReader { sp in
                    ScrollView {
                        Text(viewModel.displayedText)
                            .font(.title2)
                            .padding()
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .id("TextEditor")
                            .onChange(of: viewModel.displayedText) { newValue in
                                sp.scrollTo("TextEditor", anchor: .bottom)
                            }
                            .onAppear {
                                
//                                If you want to show static text for typewiter enable this to test
                                viewModel.startTyping(responseText: "Mount Everest: The World's Tallest Peak\n\nIntroduction\nMount Everest, also known as \"Sagarmatha\" in Nepal and \"Chomolungma\" in Tibet, is the highest mountain on Earth and one of the most iconic natural wonders of the world. Rising majestically to a staggering height of 29,032 feet (8,849 meters) above sea level, this colossal peak has long captured the imagination of adventurers, mountaineers, and nature enthusiasts. In this article, we will explore the geological and cultural significance of Mount Everest, its challenging ascent, the impact of climbing tourism, and its role in shaping the history of mountaineering.\n\nGeological Formation\n\nMount Everest is part of the Himalayan mountain range, the world's youngest and highest mountain system, which stretches across five countries: India, Nepal, Bhutan, Tibet (China), and Pakistan. This geological wonder was formed over millions of years as the Indian tectonic plate collided with the Eurasian plate, pushing up the earth's crust and creating the awe-inspiring Himalayas.\n\nThe highest point of this mighty mountain is not a fixed entity; it changes over time due to tectonic activity and geological shifts. The ongoing movement of these two colossal plates causes the Himalayas to rise a few millimeters each year. This continuous upward movement is why the height of Mount Everest is a subject of interest and debate among geologists and surveyors.\n\n Cultural Significance\n Mount Everest holds profound cultural and spiritual significance for the people of Nepal and Tibet. It is considered the \"Mother of the Universe\" and is revered as a sacred and divine site by the Sherpa and Tibetan communities. The mountain is central to their religious and cultural beliefs, and its summits are often regarded as the dwelling places of deities and spirits.\n\nEverest Base Camp Trek, Nepal\n\nFor trekkers and climbers, the journey to Mount Everest often begins at Everest Base Camp (EBC) in Nepal, which is a popular trekking destination. The trek to EBC is not only a physical adventure but also a cultural one. Trekkers get to experience the warm hospitality of the Sherpa people, learn about their traditions, and witness the breathtaking landscapes of the Khumbu region.")
//                                If you want get response from chat gpt then aenable below lines
//                                viewModel.sendMessageToChatGPT(userMessage: "" )
                                                             //Note: your prompt here inside "" e.g. "write about mount everest in 100 words "
//
                                
        

    }.padding(.bottom, 30)
                    }
                }
                
                Spacer()
                if !viewModel.isTyping {
                    VStack(alignment: .center) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Great")
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 13)
                        .frame(alignment: .center)
                        .background(Color(red: 0.86, green: 0.45, blue: 0.3))
                        .cornerRadius(10)
                    }
                    .padding(.leading,32)
                    .padding(.trailing,23)
//
                    .onTapGesture {
                        //your desired page here
                        ///
                    }
                }
                
            }
        
      
       
    }
    
}

#Preview {
    TypeWriterEffectView(responseText: "For Preview")
}
