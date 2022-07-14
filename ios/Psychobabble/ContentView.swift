//
//  ContentView.swift
//  Psychobabble
//
//  Created by Ian Chen on 5/16/22.
//

import SwiftUI

enum Category: String {
    case CTD = "CTD"//"Changing the Tone of a Disagreement"
    case GOPS = "GOPS" //"Getting Out of a Power Struggle"
    case SHB = "SHB" //"Setting Healthy Boundaries"
    case MA = "MA" //"Making Amends"
    case I2C = "I2C" //"Invitation to Connect"
    case AFU = "AFU" //"Asking for Understanding"
    case GU = "GU" //"Giving Understanding"
    case OMPP = "OMPP" //"Owning My Part in the Problem"
}

struct Card: Identifiable, Hashable {
    var id: Int
    var message: String
    var categories: Array<Category?>
    var show: Bool = false
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}

//var cards = [
//    Card(id: 0, message: "Help me understand", categories: [Category.CTD, Category.I2C, Category.GOPS]),
//    Card(id: 1, message: "What just happened?", categories: [Category.CTD, Category.GU, Category.GOPS]),
//    Card(id: 2, message: "I have a request", categories: [Category.GOPS]),
//    Card(id: 3, message: "Give me a few minutes to calm down", categories: [Category.CTD]),
//    Card(id: 4, message: "Please know that my intentions are good", categories: [Category.MA, Category.I2C]),
//]
var cards = [
    Card(id: 0, message: "Help me understand.", categories: [Category.CTD, Category.I2C, Category.GOPS]),
    Card(id: 1, message: "What just happened?", categories: [Category.CTD, Category.GU, Category.GOPS]),
    Card(id: 2, message: "I have a request.", categories: [Category.GOPS]),
    Card(id: 3, message: "Can you give me a few minutes to calm down?", categories: [Category.CTD]),
    Card(id: 4, message: "Please know my intentions are good.", categories: [Category.MA, Category.I2C]),
    Card(id: 5, message: "What's going on?", categories: [Category.CTD, Category.I2C, Category.GU]),
    Card(id: 6, message: "I don't understand but I want to.", categories: [Category.CTD, Category.I2C, Category.GU]),
    Card(id: 7, message: "How can I make it better", categories: [Category.I2C, Category.GU]),
    Card(id: 8, message: "Please use 'I statements.'", categories: [Category.GOPS, Category.SHB]),
    Card(id: 9, message: "I feel _____ (mad, sad, glad or scared.)", categories: [Category.GOPS, Category.AFU]),
    Card(id: 10, message: "Talk about how you feel, not what I did.", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 11, message: "Are we getting hung up on details or on the wrong thing?", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 12, message: "Can we stop and start over?", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 13, message: "Less is more. Say less.", categories: [Category.CTD, Category.SHB]),
    Card(id: 14, message: "I'm hurting right now and I just need a little time/space.", categories: [Category.GOPS, Category.SHB, Category.AFU]),
    Card(id: 15, message: "I understand that you're upset right now.", categories: [Category.CTD, Category.GU]),
    Card(id: 16, message: "I see it really differently. Can you help me understand your perspective?", categories: [Category.CTD, Category.GOPS, Category.SHB, Category.AFU]),
    Card(id: 17, message: "What would a comporomise look like?", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 18, message: "Where did you go? (Ask this if your partner feels emotionally distant or shut down.)", categories: [Category.CTD, Category.GOPS, Category.GU]),
    Card(id: 19, message: "It would help me if we could _____.", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 20, message: "You look upset", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 21, message: "You sound upset.", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 22, message: "Low & slow (This is a reminder to speak slowly and in a low tone of voice.)", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 23, message: "Can we rewind the tape?", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 24, message: "You Are we caught in a power struggle? upset.", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 25, message: "Can I give you some feedback?", categories: [Category.GOPS, Category.SHB]),
    Card(id: 26, message: "The story I tell myself is ____, and when I tell myself that story, I feel ____", categories: [Category.CTD, Category.GOPS, Category.AFU]),
    Card(id: 27, message: "What do you need?", categories: [Category.CTD, Category.GOPS, Category.GU]),
    Card(id: 28, message: "Please work with me.", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 29, message: "I want to help you.", categories: [Category.CTD, Category.GOPS, Category.I2C]),
    Card(id: 30, message: "I want to hear you but I can't because of ____ (Your tone, your word choice, your facial expressions ,your body language.)", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 31, message: "What works better for me is ____.", categories: [Category.GOPS, Category.SHB]),
    Card(id: 32, message: "I want to say yes, but I need to say no.", categories: [Category.SHB]),
    Card(id: 33, message: "I think we're stuck in an old pattern. Can we start over?", categories: [Category.GOPS, Category.I2C, Category.SHB]),
    Card(id: 34, message: "Your comment/question felt bad. Can you rephrase it in the form of an invitation?", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 35, message: "I need to tell you something and I'd like for you to respond.", categories: [Category.SHB, Category.I2C]),
    Card(id: 36, message: "I need to tell you something and I'd like for you to not respond.", categories: [Category.SHB]),
    Card(id: 37, message: "Are you okay?", categories: [Category.GU, Category.I2C]),
    Card(id: 38, message: "I can see that my part of what happened is: ____.", categories: [Category.OMPP, Category.CTD, Category.GOPS]),
    Card(id: 39, message: "I can't. I don't have the emotional bandwidth right now.", categories: [Category.SHB]),
    Card(id: 40, message: "Can we take a time out? (Say the amount of time you need to take: 5 mins, 1 hour, the rest of the evening.)", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 41, message: "I would love it if we could ____.", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 42, message: "I know your intentions are good.", categories: [Category.GU, Category.I2C]),
    Card(id: 43, message: "Can I offer a thought on that?", categories: [Category.I2C, Category.SHB]),
    Card(id: 44, message: "Is this a good time to talk?", categories: [Category.I2C, Category.SHB]),
    Card(id: 45, message: "How do you feel about that?", categories: [Category.GU, Category.CTD, Category.GOPS]),
    Card(id: 46, message: "I'd like to connect with you.", categories: [Category.I2C]),
    Card(id: 47, message: "I feel disconnected from you right now.", categories: [Category.I2C, Category.CTD, Category.GOPS]),
    Card(id: 48, message: "Let me think about how I'd like to respond to you.", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 49, message: "Thank you.", categories: [Category.CTD, Category.GOPS, Category.GU, Category.MA]),
    Card(id: 50, message: "I'm sorry.", categories: [Category.MA, Category.I2C, Category.CTD, Category.GOPS]),
    Card(id: 51, message: "Can you use different words?", categories: [Category.CTD, Category.GOPS, Category.SHB]),
    Card(id: 52, message: "I'd be happy to but I can't right now.", categories: [Category.AFU]),
    Card(id: 53, message: "Can you say that again in a different way?", categories: [Category.CTD, Category.GOPS, Category.SHB, Category.I2C]),
]

var cardWidth = UIScreen.main.bounds.width - 150

enum Screen {
    case HOME
    case GUIDE
    case FILTERS
    case CARD
}

struct ContentView : View {

    // For Carousel
    @State var x : CGFloat = 0
    @State var count : Int = 0
    @State var currentCategory: Category? = nil
    @State var data = cards
    @State var currentScreen: Screen = Screen.HOME
    
    @State private var showMenu: Bool = false
    
    var body : some View {
        
        let filteredData = data.filter { card in
            currentCategory == nil || card.categories.contains(currentCategory)
        }
        
        NavigationView{
            GeometryReader { geometry in
                ZStack{
                    switch currentScreen {
                        case .HOME:
                        ZStack(alignment: .top){
                                VStack {
                                    Spacer()
                                    HStack(spacing: 0) {
                                        ForEach(0..<filteredData.count) { i in
                                            if(i < filteredData.count) {
                                                let card = filteredData[i]
                                                let isLeft: Bool = i == self.count - 1
                                                let isRight: Bool = i == self.count + 1
                                                let isCenter: Bool = i == self.count
                                                let cardSize = isCenter ? cardWidth + 40 : cardWidth
                                                let cardOffset = self.x + (isLeft ? 50 : isRight ? -50 : 0)
                                                CardView(data: card)
                                                    .frame(width: cardSize, height: cardSize)
                                                    .offset(x: cardOffset)
                                                    .zIndex(i == count ? 1 : 0)
                                                    .highPriorityGesture(DragGesture()
                                                        .onChanged({ (value) in
                                                            let offset : CGFloat = -(CGFloat(self.count) * cardWidth)
                                                            let translation = value.location.x - value.startLocation.x
                                                            self.x = offset + translation
                                                        })
                                                            .onEnded({ (value) in
                                                                if value.translation.width > 0 && self.count > 0 {
                                                                    self.count -= 1
                                                                } else if value.translation.width < 0  && self.count < (filteredData.count - 1) {
                                                                    self.count += 1
                                                                }
                                                                let offset: CGFloat = -(CGFloat(self.count) * cardWidth)
                                                                self.x = offset
                                                            })
                                                    )
                                            }
                                            
                                        }.id(filteredData)
                                    }
                                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                                    .offset(x: ((UIScreen.main.bounds.width - cardWidth) / 2) - 20)
                                    Spacer()
                                }
                                VStack(alignment: .center) {
                                    Text("PSYCHOBABBEL")
                                        .font(.system(size: 35, weight: .semibold, design: .default))
                                    Spacer()
                                        .frame(height: 8)
                                    Text("A BETTER WAY TO COMMUNICATE")
                                        .font(.system(size: 12, weight: .semibold, design: .default))
                                        .foregroundColor(.white)
                                }
                                .padding()
                            }
                            .background(Color(red: 113 / 255, green: 147 / 255, blue: 145 / 255).edgesIgnoringSafeArea(.bottom))
                            .offset(x: self.showMenu ? abs(geometry.size.width * 0.65) : 0)
                            .animation(.spring())
                        case .GUIDE: VStack {
                            Text("HOW TO USE YOUR PSYCHOBABBEL CARDS™")
                                .multilineTextAlignment(.center)
                            Rectangle()
                                .fill(.black)
                                .frame(width: 200, height: 2)
                            Text("READ ALL THE CARDS ALOUD TOGETHER WITH YOUR MATE. WORK ON MEMORIZING SOME OF THE SAYINGS, ESPECIALLY THOSE YOU THINK WILL BE MOST HELPFUL. TALK ABOUT WHEN AND HOW YOU WILL USE THE CARDS. GO TO \n[PSYCHOBABBEL.COM/GENERAL-INSTRUCTIONS](https://www.psychobabbel.com/general-instructions)\nFOR COMPLETE, DOWNLOADABLE INSTRUCTIONS. ")
                                .multilineTextAlignment(.center)
                            Spacer()
                            Text("USE THIS CARD WHEN YOUR MATE IS SAYING SOMETHING THAT IS MAKING YOU ANGRY.")
                                .multilineTextAlignment(.center)
                            Spacer()
                        }.padding(24)
                        case .FILTERS: ScrollView {
                            VStack(alignment: .center) {
                                Text("WHEN YOU WOULD LIKE TO:")
                                    .font(.system(size: 20).bold())
                                Spacer()
                                    .frame(height: 48)
                                HStack {
                                    Text("CHANGE THE TONE OF A DISAGREEMENT")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 228/255, green:159/255, blue:68/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .CTD
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                    Spacer()
                                    Text("GET OUT OF A POWER STRUGGLE")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 74/255, green:156/255, blue:165/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .GOPS
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                }
                                Spacer()
                                    .frame(height: 16)
                                HStack {
                                    Text("SET HEALTHY BOUNDARIES")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 113/255, green:147/255, blue:145/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .SHB
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                    Spacer()
                                    Text("MAKE AMENDS")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 126/255, green:112/255, blue:100/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .MA
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                }
                                Spacer()
                                    .frame(height: 16)
                                HStack {
                                    Text("INVITE YOUR MATE TO CONNECT")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 229/255, green:203/255, blue:174/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .I2C
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                    Spacer()
                                    Text("ASK FOR UNDERSTANDING")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 228/255, green:159/255, blue:68/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .AFU
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                }
                                Spacer()
                                    .frame(height: 16)
                                HStack {
                                    Text("GIVE UNDERSTANDING")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 74/255, green:156/255, blue:165/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .GU
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                    Spacer()
                                    Text("OWN YOUR PART IN THE PROBLEM")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 12).bold())
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 120)
                                        .padding(16)
                                        .background(Color(red: 113/255, green:147/255, blue:145/255))
                                        .cornerRadius(16)
                                        .onTapGesture(perform: {
                                            currentCategory = .OMPP
                                            self.count = 0
                                            self.x = 0
                                            currentScreen = .HOME
                                        })
                                }
                            }.padding(24)
                        }
                        default: Text("Error")
                    }
                    HStack {
                        
                        SideMenuView(onClick: { category in
                            self.count = 0
                            self.x = 0
                            currentCategory = category
                            showMenu = false
                        }, onClose: {
                            showMenu = false;
                        }, onHomeSelected: {
                            currentScreen = Screen.HOME
                            showMenu = false
                        }, onGuideSelected: {
                            currentScreen = Screen.GUIDE
                            showMenu = false;
                        }, onFiltersSelected: {
                            currentScreen = Screen.FILTERS
                            showMenu = false;
                        })
                        .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width) // Making it a negative value will open the side menu from the left
                        .animation(.easeInOut(duration: 0.4), value: showMenu)
                    }
                    
                }.toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if !showMenu {
                            Button {
                                self.showMenu.toggle()
                            } label: {
                                
                                    Image(systemName: "text.justify")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(currentScreen == .HOME ? Color.white : Color.black)
                                
                            }
                        }
                    }
                }.background(currentScreen == .HOME ? Color(red: 113/255, green:147/255, blue:145/255) : Color(red: 249, green: 246, blue: 246))
            }
        } // NavigationView
    } // View
}

struct CardView: View {
    var data: Card
    
    var body: some View {
        NavigationLink(
            destination: {
                Text(data.message)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 35, weight: .semibold, design: .default))
            },
            label:{
                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }.padding(40)
            })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 255, green: 255, blue: 255))
        .border(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
