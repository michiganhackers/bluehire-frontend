import SwiftUI

struct Profile_Page: View {
    @State var mobPhoneNumber = ""
    @State var mobEmail = ""
    @State var streak = "3"
    @State private var selectedTab = "profile" // Track which section is active
    // Add this with your state variables
    @State var companies = ["Google", "Meta", "Amazon", "Netflix", "Apple", "Spacex"]
    @State var followingCompanies = Array(repeating: false, count: 6)
    @State var isSortedAscending = true
    @State var showFollowingOnly = false // New state to track the toggle

    

    let interests = ["Machine Learning", "Cybersecurity", "Web Development", "Blockchain", "AI Ethics", "Cloud Computing"] // Sample interests

    let interestColors: [Color] = [
        .red, .green, .blue, .indigo , .purple, .cyan
        ]

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(.defaultPfp)
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
                    .frame(height: 150)
                
                Button(action: {
                    print("Edit button tapped") // Replace with backend call later
                }) {
                    Image(systemName: "square.and.pencil.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35) // Adjust size of the icon
                        .foregroundColor(.orange) // Change color as needed
                        .background(Color.white) // Optional: Add a white background
                        .clipShape(Circle()) // Ensure it's round
                        .shadow(radius: 3) // Add subtle shadow
                }
            }
            
            Text("John Doe")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Solutions Architect @ Umich")
                .font(.subheadline)
                .fontWeight(.ultraLight)
            
            ZStack(alignment: .topLeading) {
                        Text("\(streak) Day Streak")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .frame(width: 120, height: 10) // Fixed size for consistency
                            .padding(5) // Reduced padding
                            .background(Color(UIColor.systemGray5)) // Light gray background
                            .cornerRadius(10) // Rounded corners
                        
                        Image(systemName: "flame.fill") // Fire icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30) // Larger fire icon
                            .foregroundColor(.orange) // Orange color
                            .offset(x: -15,y:-10) // Move it slightly up and left
                    }
            .padding(5)
            
            Divider()
                .frame(height: 3)
                .overlay(Color.gray)
                .padding(.horizontal, 40)

            // HStack with Profile and Saved buttons
            HStack {
                Button(action: { selectedTab = "profile" }) {
                    Text("Profile")
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .padding()
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                        .fontWeight(selectedTab == "profile"
                                    ? .semibold : .regular)
                }
                
                Button(action: { selectedTab = "saved" }) {
                    Text("Saved")
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .padding()
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                        .fontWeight(selectedTab == "profile"
                                    ? .regular : .semibold)
                }
            }
            .padding(.horizontal, 40)

            // Show different content based on selectedTab
            if selectedTab == "profile" {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Your email")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.semibold)
                            .padding(.leading, 40)
                        
                        Image(systemName: "square.and.pencil.circle.fill")
                            .foregroundStyle(Color.orange)
                            .imageScale(.large)

                    }
                    HStack {
                        Image(systemName: "envelope.fill")
                        ZStack(alignment: .leading) {
                            if mobEmail.isEmpty {
                                Text("xxx @gmail.com")
                                    .foregroundColor(.gray) // Placeholder color
                            }
                            TextField("", text: $mobEmail)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    
                    HStack {
                        Text("Phone Number")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.semibold)
                            .padding(.leading, 40)
                        
                        Image(systemName: "square.and.pencil.circle.fill")
                            .foregroundStyle(Color.orange)
                            .imageScale(.large)
                        
                    }
                    HStack {
                        Image(systemName: "phone")
                        ZStack(alignment: .leading) {
                            if mobPhoneNumber.isEmpty {
                                Text("+93123135")
                                    .foregroundColor(.gray) // Placeholder color
                            }
                            TextField("", text: $mobPhoneNumber)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    
                    HStack {
                        Text("Interests")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.semibold)
                            .padding(.leading, 40)
                        
                        Image(systemName: "square.and.pencil.circle.fill")
                            .foregroundStyle(Color.orange)
                            .imageScale(.large)
                        
                    }
                    
                    if interests.isEmpty {
                        Text("Loading interests...") // Show loading message while fetching
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(interests.indices, id: \.self) { index in
                        Text(interests[index])
                            .font(.caption)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(interestColors[index % interestColors.count]) // Cycle through colors
                            .cornerRadius(10)
                            .foregroundColor(.white) // Set text color to white
                                                }
                                            }
                        .padding(.horizontal, 20)
                        .padding([.leading, .trailing], 20)
                    }
                }
            } else {
                VStack(alignment: .leading) {
                    // "Following" + sort icon together
                    HStack(spacing: 1) {
                        Button(action: {
                            showFollowingOnly.toggle()}) {
                                Image(systemName: showFollowingOnly ? "checkmark.square.fill" : "square")
                                    .foregroundColor(showFollowingOnly ? .blue : .gray)
                                    .font(.title3)
                                    .padding(.leading, 40)
                            }
                        
                        Text("Following")
                            .multilineTextAlignment(.leading)
                            .font(.body) // or .subheadline if you want it smaller like "Your email"
                            .fontWeight(.semibold)
                            .padding(.leading, 5)

                        
                        Button(action: {
                            isSortedAscending.toggle()
                            let combined = zip(companies, followingCompanies).sorted {
                                isSortedAscending ? $0.0 < $1.0 : $0.0 > $1.0
                            }
                            companies = combined.map { $0.0 }
                            followingCompanies = combined.map { $0.1 }
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .font(.body) // larger
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                        }
                    }
                    
                    Divider()
                        .frame(height: 3)
                        .overlay(Color.gray)
                        .padding(.horizontal, 40)
                    
                    // Company list
                    ForEach(companies.indices, id: \.self) { index in
                        HStack(spacing: 12) {
                            Button(action: {
                                followingCompanies[index].toggle()
                            }) {
                                Image(systemName: followingCompanies[index] ? "checkmark.square.fill" : "square")
                                    .foregroundColor(followingCompanies[index] ? .blue : .gray)
                                    .font(.title3) // slightly bigger
                            }
                            
                            Text(companies[index])
                                .font(.body) // bigger text
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8) // more space between rows
                    }
                }
            }



            Spacer()
        }
    }
}

#Preview {
    Profile_Page()
}
