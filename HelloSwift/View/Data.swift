//
//  RawData.swift
//  HelloSwift
//
//

import SwiftUI
import MapKit

struct Documentation {
    var name: String
    var category: String
    var description: String
    var declaration: String
    var overview: String
    var parameters: [(String, String)]? = nil
    var imageFilenames: [String]? = nil
}

let documentation: [String: Documentation] = ["resizable" :
    Documentation(name: ".resizable()",
          category: "Modifier",
          description: "Sets the mode by which SwiftUI resizes an image to fit its space.",
          declaration: "func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image",
          overview: """
    Return Value:
    An image, with the new resizing behavior set.
    """, parameters: [("capInsets", "Inset values that indicate a portion of the image that SwiftUI doesn’t resize."), ("resizingMode","The mode by which SwiftUI resizes the image.")]), "scaledtofit":
    Documentation(name: ".scaledToFit()",
          category: "Modifier",
          description: "Scales this view to fit its parent.",
          declaration: "func scaledToFit() -> some View",
          overview: """
    Return Value:
    A view that scales this view to fit its parent, maintaining this view’s aspect ratio.
    
    Discussion:
    Use scaledToFit() to scale this view to fit its parent, while maintaining the view’s aspect ratio as the view scales.

    Circle()
    .fill(Color.pink)
    .scaledToFit()
    .frame(width: 300, height: 150)
    .border(Color(white: 0.75))

    ⬆ See figure 1 below: A screenshot of pink circle scaled to fit its frame.

    This method is equivalent to calling aspectRatio(_:contentMode:) with a nil aspectRatio and a content mode of fit.
    """, parameters: [("capInsets", "Inset values that indicate a portion of the image that SwiftUI doesn’t resize."), ("resizingMode","The mode by which SwiftUI resizes the image.")], imageFilenames: ["pinkcircle"]), "button" :
    Documentation(name: "Button",
          category: "Structure",
          description: "A control that performs an action when triggered.",
          declaration: "struct Button<Label> where Label : View",
          overview: """
    You create a button by providing an action and a label. The action is either a method or closure property that does something when a user clicks or taps the button. The label is a view that describes the button’s action, for example, by showing text such as Cancel or an icon such as a back arrow.

    Button(action: signIn) {
        Text("Sign In")
    }

    For the common case of text-only labels, you can use the convenience initializer that takes a title string (or localized string key) as its first parameter, instead of a trailing closure:

    Button("Sign In", action: signIn)

    The method of triggering the button varies by platform:

    In iOS and watchOS, the user triggers a standard button by tapping on it.

    In macOS, the user triggers a standard button by clicking on it.

    In tvOS, the user triggers a standard button by pressing “select” on an external remote, like the Siri Remote, while focusing on the button.

    Adding Buttons to Containers:
    Use buttons for any user interface element that triggers actions on press. Buttons automatically adapt their visual style to match the expected style within these different containers and contexts. For example, to create a list cell that triggers an action when selected by the user, add a button to the list’s content. For example:

    // A list of items, where the last row, when triggered,
    // opens a UI for adding a new item.
    List {
        ForEach(items) { item in
        Text(item.title)
        }
        Button("Add Item", action: addItem)
    }

    Similarly, to create a context menu item that triggers an action, add a button to the menu’s content:

    .contextMenu {
        Button("Cut", action: cut)
        Button("Copy", action: copy)
        Button("Paste", action: paste)
    }

    This pattern extends to most other container views in SwiftUI that have customizable, interactive content, like forms (instances of Form).

    Styling Buttons:
    You can customize a button’s appearance and interaction behavior. To add a custom appearance with standard interaction behavior, create a style that conforms to the ButtonStyle protocol. To customize both appearance and interaction behavior, create a style that conforms to the PrimitiveButtonStyle protocol. To set a specific style for all button instances within a view, use the buttonStyle(_:) modifier:

    HStack {
        Button("Sign In", action: signIn)
        Button("Register", action: register)
    }
    .buttonStyle(BorderedButtonStyle())
    """), "image":
    Documentation(name: "Image",
        category: "Structure",
        description: "A view that displays an image.",
        declaration: "@frozen struct Image",
        overview: """
    Use an Image instance when you want to add images to your SwiftUI app. You can create images from many sources:

    · Image files in your app’s asset library or bundle. Supported types include PNG, JPEG, HEIC, and more.
    · Instances of platform-specific image types, like UIImage and NSImage.
    · A bitmap stored in a Core Graphics CGImage instance.
    · System graphics from the SF Symbols set.

    The following example shows how to load an image from the app’s asset library or bundle and scale it to fit within its container:

    Image("Landscape_4")
      .resizable()
      .aspectRatio(contentMode: .fit)
    Text("Water wheel")

    ⬆ See figure 1 below: An image of a water wheel and its adjoining building, resized to fit the frame.

    You can use methods on the Image type as well as standard view modifiers to adjust the size of the image to fit your app’s interface. Here, the Image type’s resizable(capInsets:resizingMode:) method scales the image to fit the current view. Then, the View/aspectRatio(_:contentMode:)-7w44p view modifier adjusts this resizing behavior to maintain the image’s original aspect ratio, rather than scaling the x- and y-axes independently to fill all four sides of the view. The article Fitting Images into Available Space shows how to apply scaling, clipping, and tiling to Image instances of different sizes.

    An Image is a late-binding token; the system resolves its actual value only when it’s about to use the image in an environment.

    Making Images Accessible:
    To use an image as a control, use one of the initializers that takes a label parameter. This allows the system’s accessibility frameworks to use the label as the name of the control for users who use features like VoiceOver. For images that are only present for aesthetic reasons, use an initializer with the decorative parameter; the accessibility systems ignore these images.
    """, imageFilenames: ["waterwheel"]), "padding":
        Documentation(name: ".padding()",
            category: "Modifier",
            description: "A view that pads this view inside the specified edge insets with a system-calculated amount of padding.",
            declaration: "func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View",
            overview: """
        Return Value:
        A view that pads this view using the specified edge insets with specified amount of padding.

        Use padding(_:) to add a system-calculated amount of padding inside one or more of the view’s edges by passing either a single edge name, or an OptionSet describing which edges should be padded. For example you can add padding to the bottom of a text view:

        VStack {
            Text("Text padded on the bottom edge.")
                .padding(.bottom)
                .border(Color.gray)
            Text("Unpadded text")
                .border(Color.yellow)
        }

        ⬆️ See figure 1 below: A view showing padding added to the view’s bottom.

        To pad the view’s insets, which affects the amount of padding inside the edges of the view, see padding(_:). To pad all outside edges of a view with an amount you specify, see padding(_:).
        """, imageFilenames: ["padding"]), "vstack":
            Documentation(name: "VStack",
                category: "Structure",
                description: "A view that arranges its children in a vertical line.",
                declaration: "@frozen struct VStack<Content> where Content : View",
                overview: """
            Unlike LazyVStack, which only renders the views when your app needs to display them onscreen, a VStack renders the views all at once, regardless of whether they are on- or offscreen. Use the regular VStack when you have a small number of child views or don’t want the delayed rendering behavior of the “lazy” version.
                
            The following example shows a simple vertical stack of 10 text views:
                
            var body: some View {
                VStack(
                    alignment: .leading,
                    spacing: 10
                ) {
                    ForEach(
                        1...10,
                        id: \\.self
                    ) {
                        Text("Item \\($0)")
                    }
                }
            }
                
            ⬆️ See figure 1 below: Ten text views, named Item 1 through Item 10, arranged in a stack.
            """, imageFilenames: ["vstack"]), "font":
            Documentation(name: ".font()",
                category: "Modifier",
                description: "Sets the default font for text in the view.",
                declaration: "func font(_ font: Font?) -> Text",
                overview: """
            Return Value:
            Text that uses the font you specify.
                
            Use font(_:) to apply a specific font to an individual Text View, or all of the text views in a container.

            In the example below, the first text field has a font set directly, while the font applied to the following container applies to all of the text views inside that container:

            VStack {
                Text("Font applied to a text view.")
                    .font(.largeTitle)

                VStack {
                    Text("These two text views have the same font")
                    Text("applied to their parent view.")
                }
                .font(.system(size: 16, weight: .light, design: .default))
            }

            ⬆️ See figure 1 below. Applying a font to a single text view or a view container.
            """, imageFilenames: ["font"]), "text":
            Documentation(name: "Text",
                category: "Structure",
                description: "A view that displays one or more lines of read-only text.",
                declaration: "@frozen struct Text",
                overview: """
            A text view draws a string in your app’s user interface using a body font that’s appropriate for the current platform. You can choose a different standard font, like title or caption, using the font(_:) view modifier.

            Text("Hamlet")
                .font(.title)

            ⬆️ See figure 1 below: A text view showing the name “Hamlet” in a title.

            If you need finer control over the styling of the text, you can use the same modifier to configure a system font or choose a custom font. You can also apply view modifiers like bold() or italic() to further adjust the formatting.

            Text("by William Shakespeare")
                .font(.system(size: 12, weight: .light, design: .serif))
                .italic()

            ⬆️ See figure 2 below: A text view showing by William Shakespeare in a 12 point, light, italic font.

            A text view always uses exactly the amount of space it needs to display its rendered contents, but you can affect the view’s layout. For example, you can use the frame(width:height:alignment:) modifier to propose specific dimensions to the view. If the view accepts the proposal but the text doesn’t fit into the available space, the view uses a combination of wrapping, tightening, scaling, and truncation to make it fit. With a width of 100 points but no constraint on the height, a text view might wrap a long string:

            Text("To be, or not to be, that is the question:")
                .frame(width: 100)

            ⬆️ See figure 3 below: A text view showing a quote from Hamlet split over three lines.

            Use modifiers like lineLimit(_:), allowsTightening(_:), minimumScaleFactor(_:), and truncationMode(_:) to configure how the view handles space constraints. For example, combining a fixed width and a line limit of 1 results in truncation for text that doesn’t fit in that space:

            Text("Brevity is the soul of wit.")
                .frame(width: 100)
                .lineLimit(1)

            ⬆️ See figure 4 below: A text view showing a truncated quote from Hamlet starting "Brevity is t..."

            Localizing Strings:
            If you initialize a text view with a string literal, the view uses the init(_:tableName:bundle:comment:) initializer, which interprets the string as a localization key and searches for the key in the table you specify, or in the default table if you don’t specify one.

            Text("pencil") // Searches the default table in the main bundle.

            For an app localized in both English and Spanish, the above view displays “pencil” and “lápiz” for English and Spanish users, respectively. If the view can’t perform localization, it displays the key instead. For example, if the same app lacks Danish localization, the view displays “pencil” for users in that locale. Similarly, an app that lacks any localization information displays “pencil” in any locale.

            To explicitly bypass localization for a string literal, use the init(verbatim:) initializer.

            Text(verbatim: "pencil") // Displays the string "pencil" in any locale.

            If you intialize a text view with a variable value, the view uses the init(_:) initializer, which doesn’t localize the string. However, you can request localization by creating a LocalizedStringKey instance first, which triggers the init(_:tableName:bundle:comment:) initializer instead:

            // Don't localize a string variable...
            Text(writingImplement)

            // ...unless you explicitly convert it to a localized string key.
            Text(LocalizedStringKey(writingImplement))

            When localizing a string variable, you can use the default table by omitting the optional initialization parameters — as in the above example — just like you might for a string literal.
            """, imageFilenames: ["text1", "text2", "text3", "text4"])
]


struct Cop: Identifiable {
    var id = UUID()
    var name: String
    var department: String = "Oakland Police Department"
    var badgeNumber: Int
    var unit: String
    var jobTitle: String
    var gender: String
    var imageFilename: String?
    var employmentDate: Date = Date()
}

let cops = [
    Cop(name: "Jesse Aguilar",
        badgeNumber: 531,
        unit: "UC Berkeley",
        jobTitle: "Police Officer",
        gender: "Male",
        imageFilename: "officer1"),
    Cop(name: "Felicia R. Aisthorpe",
        badgeNumber: 876,
        unit: "Oakland",
        jobTitle: "Commander",
        gender: "Female",
        imageFilename: "officer2"),
    Cop(name: "Darren J. Allison",
        badgeNumber: 1,
        unit: "Oakland",
        jobTitle: "Department Chief",
        gender: "Male",
        imageFilename: "officer3"),
    Cop(name: "Gilberto R. Aranda",
        badgeNumber: 983,
        unit: "Oakland",
        jobTitle: "Police Officer",
        gender: "Male",
        imageFilename: nil),
    Cop(name: "Omar K. Ashford",
        badgeNumber: 146,
        unit: "Oakland",
        jobTitle: "Sergeant",
        gender: "Male",
        imageFilename: "officer5"),
    Cop(name: "Justin T. Belligan",
        badgeNumber: 402,
        unit: "Oakland",
        jobTitle: "Police Officer",
        gender: "Male",
        imageFilename: "officer6"),
    Cop(name: "Unknown",
        badgeNumber: 0,
        unit: "Oakland",
        jobTitle: "Unknown",
        gender: "Male",
        imageFilename: "officer7"),
    Cop(name: "Justin T. Belligan",
        badgeNumber: 402,
        unit: "Oakland",
        jobTitle: "Police Officer",
        gender: "Male",
        imageFilename: "officer6"),
    Cop(name: "Unknown",
        badgeNumber: 531,
        unit: "UC Berkeley",
        jobTitle: "Unknown",
        gender: "Female",
        imageFilename: "officer8"),
    Cop(name: "Darren J. Allison",
        badgeNumber: 1,
        unit: "Oakland",
        jobTitle: "Department Chief",
        gender: "Male",
        imageFilename: nil),
    Cop(name: "Gilberto R. Aranda",
        badgeNumber: 983,
        unit: "Oakland",
        jobTitle: "Police Officer",
        gender: "Male",
        imageFilename: "officer4"),
    Cop(name: "Omar K. Ashford",
        badgeNumber: 146,
        unit: "Oakland",
        jobTitle: "Sergeant",
        gender: "Male",
        imageFilename: nil),
    Cop(name: "Unknown",
        badgeNumber: 531,
        unit: "UC Berkeley",
        jobTitle: "Unknown",
        gender: "Female",
        imageFilename: "officer8"),
    Cop(name: "Jesse Aguilar",
    badgeNumber: 531,
    unit: "UC Berkeley",
    jobTitle: "Police Officer",
    gender: "Male",
    imageFilename: "officer1"),
    Cop(name: "Felicia R. Aisthorpe",
    badgeNumber: 876,
    unit: "Oakland",
    jobTitle: "Commander",
    gender: "Female",
    imageFilename: nil)
    
]

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let description: String
}


let locations = [
   Location(name: "American University",
            coordinate: CLLocationCoordinate2D(latitude: 38.9456613325282, longitude: -77.0804072903886),
            description: """
            American University has divested from public fossil fuel investments in its endowment, it announced today.

            The private nonprofit university in Washington, D.C., sold $350 million in commingled funds and index funds to complete the divestment. It reinvested proceeds from those sales into other investments not including fossil fuel holdings.
            """),
   Location(name: "Brevard College",
            coordinate: CLLocationCoordinate2D(latitude: 35.236668483737105, longitude: -82.73014067254742),
            description: """
            Brevard College in Transylvania County is the first school in the Southeast to commit to pulling investments out of fossil fuels after a vote by trustees, and officials are calling the move a symbolic step to bring further public awareness to climate change.

            "This sets a precedent," said Emily Crowley, a senior and student organizer for the campaign. "It might not make a dent in the profits of the oil companies, but it tells the nation that we're done with fossil fuels and an unsustainable business."

            In the Friday vote, trustees moved ahead with a resolution to divest the college's $25 million endowment from fossil fuels by 2018. Less than 4 percent, or approximately $600,000, is invested in fossil fuels.

            The resolution also calls on the investment committee, which picks asset classes for the endowment, to consider green technologies for underperforming stocks and as fossil fuel replacements when financially viable.
            """),
    Location(name: "Brown University",
             coordinate: CLLocationCoordinate2D(latitude: 41.826859721390484, longitude: -71.40298808441513),
             description: """
            The University is in the process of selling all of its direct investments and managed funds that focus on fossil fuels, President Christina Paxson P’19 wrote in a March 4 Today@Brown announcement.

            The letter also informed the community of the University’s new role as a founding partner of the Providence Resiliency Partnership, as well as the University’s progress in reducing greenhouse gases on campus.

            The process of selling investments in fossil fuel companies began in October 2017, Vice President and Chief Investment Officer Jane Dietze wrote in an email to The Herald. By June 2018, the University had sold most of its fossil fuel portfolio, she added. According to Paxson’s letter, the University has now sold 90 percent of its investments in fossil fuel extraction companies. The remaining 10 percent is still in the process of being sold, though this process will take time due to the “illiquid nature of some investments,” Dietze wrote.

            The University’s endowment investments are now 0.9 percent in fossil fuel companies as opposed to 6.5 percent before the sale. Of endowment investments in fossil fuels, “The Ivy League peer average, calculated to the best of our ability, is 6.5 percent,” Dietze wrote.

            It is due in part to the “accelerating decline in the cost of alternative energy sources” and “escalating uncertainty” in the economic future of fossil fuels that the Investment Office made the decision to sell these investments, Dietze wrote. “People know that this sector is dying, … and it’s just not a good long-term investment,” Paxson told The Herald. “It carries too much risk for the endowment.”
            """),
    Location(name: "California Institute of the Arts",
             coordinate: CLLocationCoordinate2D(latitude: 34.39284021321256, longitude: -118.5676707962453),
             description: """
            In December 2014, CalArts announced that it would immediately reduce the institute's investments in fossil-fuel stocks by 25% (reallocating about $3.6 million in its portfolio) and would continue to not make direct investments in fossil fuel. The institute also announced that it would "actively monitor the Institute's remaining carbon exposure and consider strategies that will continue to reduce the Institute's investments in fossil fuel companies, including seeking to eliminate exposure to the most carbon-intensive companies such as coal producers over the next five years."
            """),
    Location(name: "College of the Atlantic",
             coordinate: CLLocationCoordinate2D(latitude: 44.39485328420527, longitude: -68.2217407817399),
             description: """
            In March 2013, the college's board of trustees voted to divest from fossil-fuel companies. About $1 million of the college's $30 million endowment was invested in such companies."
            """),
    Location(name: "California State University, Chico",
             coordinate: CLLocationCoordinate2D(latitude: 39.728599804180206, longitude: -121.84887324714248),
             description: """
            In December 2014, the board of governors of the Chico State University Foundation, which manages the university's endowment, voted to change its investment policy and divest of holdings in fossil fuel companies. At the time the policy was adopted, the foundation had "no direct holdings in fossil-fuel companies and just under 2 percent of its portfolio in managed funds that include fossil fuel investments." The vote calls for excluding any direct investment in the top 200 fossil fuel companies and liquidating, within four years, all holdings in managed funds that include investments in fossil fuel companies.
            """),
    
    Location(name: "College of the Marshall Islands",
             coordinate: CLLocationCoordinate2D(latitude: 7.103215052312344, longitude: 171.37833311635745),
             description: """
             In December 2014 and January 2015, the college announced that its board of regents would be adopting a policy statement divising its small endowment (about $1 million) from fossil fuels.
             """),
    Location(name: "Cornell University",
             coordinate: CLLocationCoordinate2D(latitude: 35.236668483737105, longitude: -82.73014067254742),
             description: """
             In May 2020, the Board of Trustees voted to divest from fossil fuels by instituting a moratorium on new private investment focused on fossil fuels. Investments are expected to grow in alternative and renewable energy portfolios. The committee's vote includes ending all current investments in fossil fuels over the next five to seven years.
             """),
     Location(name: "Foothill–De Anza Community College District",
              coordinate: CLLocationCoordinate2D(latitude: 41.826859721390484, longitude: -71.40298808441513),
              description: """
             The foundation's board of directors voted in October 2013 to divest from the top 200 fossil-fuel companies by June 2014, becoming the first community college foundation in the nation to commit to fossil-fuel divestment.
             """),
     Location(name: "George Washington University",
              coordinate: CLLocationCoordinate2D(latitude: 34.39284021321256, longitude: -118.5676707962453),
              description: """
              In June 2020, the college's board of trustees voted to divest from fossil fuels, which make up about 3% of the college's endowment.
             """),
     Location(name: "Goddard College",
              coordinate: CLLocationCoordinate2D(latitude: 44.39485328420527, longitude: -68.2217407817399),
              description: """
              In January 2015, the college announced that it had completed its divestment, moving all of its endowment funds into fossil fuel-free accounts, becoming the third college in Vermont to do so."
             """),
     Location(name: "Green Mountain College",
              coordinate: CLLocationCoordinate2D(latitude: 39.728599804180206, longitude: -121.84887324714248),
              description: """
             In May 2013, the college's board of trustees approved immediate divestment from the top 200 publicly traded fossil-fuel companies. Such investments made up about 1% of the college's $3.1 million endowment.
             """),
        
    Location(name: "Hampshire College",
         coordinate: CLLocationCoordinate2D(latitude: 41.826859721390484, longitude: -71.40298808441513),
         description: """
        In December 2011, in the college's board of trustees approved a new environmental, social, and governance investing policy which called for "negligible fossil fuel holdings in our portfolio." The college announced in October 2012 that it had nearly completed the implementation of this policy.
        """),
    Location(name: "Humboldt State University",
         coordinate: CLLocationCoordinate2D(latitude: 34.39284021321256, longitude: -118.5676707962453),
         description: """
         Since at least 2004, the university has had no direct investments in fossil fuel-related industries.[172] In April 2014, the Humboldt State University Advancement Foundation, which oversees the university's endowment, unanimously adopted a new "environmentally responsible offset and mitigation policy" and "Humboldt Investment Pledge" to strictly limit its holdings in a variety of industries, including companies directly or indirectly involved in fossil fuels.[172][173] In October 2014, the foundation's board voted to shift 10% of its overall portfolio to "green funds" (funds with no holdings in fossil fuels or similar sectors) over the next year, reiterated its policy against direct investments in fossil fuels, and committed to creating a new fund invested entirely free of fossil fuels, with the distributions from the fund earmarked for campus-based sustainability projects.
        """),
    Location(name: "Johns Hopkins University",
         coordinate: CLLocationCoordinate2D(latitude: 44.39485328420527, longitude: -68.2217407817399),
         description: """
         In December 2017 the Board of trustees votes to eliminate investments in companies that produce coal for electric power as a major part of their business.
        """),
    Location(name: "Lewis & Clark College",
         coordinate: CLLocationCoordinate2D(latitude: 39.728599804180206, longitude: -121.84887324714248),
         description: """
        In February 2018 the Board of trustees unanimously voted to divest from all fossil fuel holdings in the school endowment.
        """),

    
]

struct BailFund: Identifiable {
    var id = UUID()
    var name: String
    var url: String
    var city: String
}

struct StateStruct: Identifiable {
    var id = UUID()
    var state: String
    var bailFunds: [BailFund]
}

let bailFundsByState = [
    StateStruct(state: "Alabama",
          bailFunds: [
            BailFund(name: "No One Left Behind Fund",
                     url: "https://givebutter.com/NobodyLeftBehindBailFund",
                     city: "Birmingham"),
            BailFund(name: "Huntsville Bail Fund",
                     url: "https://www.paypal.com/paypalme/hsvbailfund",
                     city: "Huntsville"),
            BailFund(name: "Montgomery Bail Out Fund",
                     url: "https://www.mgmbailout.com",
                     city: "Montgomery"),
            BailFund(name: "Tuscaloosa Bail Out",
                     url: "https://tuscaloosabailout.com",
                     city: "Tuscaloosa"),
          ]),
    StateStruct(state: "Arizona",
          bailFunds: [
            BailFund(name: "Tucson Second Chance Community Bail Fund",
                     url: "https://www.tucsonbailfund.org",
                     city: "Tuscon")
          ]),
    StateStruct(state: "Arkansas",
          bailFunds: [
            BailFund(name: "Little Rock Freedom Fund",
                     url: "https://www.lrfreedomfund.com",
                     city: "Little Rock")
          ]),
    StateStruct(state: "California",
          bailFunds: [
            BailFund(name: "Anti Police-Terror Project",
                     url: "https://www.antipoliceterrorproject.org/donate",
                     city: "Bay Area"),
            BailFund(name: "Bay Area Anti-Repression Committee Bail Fund",
                     url: "https://rally.org/ARCbailfund",
                     city: "Bay Area"),
            BailFund(name: "Oakland's People's Breakfast Bail Fund",
                     url: "https://linktr.ee/PBO",
                     city: "Bay Area"),
            BailFund(name: "NorCal Resist Activist Bail Fund",
                     url: "https://actionnetwork.org/fundraising/ncrbailfund/",
                     city: "Sacramento"),
            BailFund(name: "Los Angeles Action Bail Fund",
                     url: "https://linktr.ee/actionbailfundla",
                     city: "Los Angeles"),
            BailFund(name: "FTP Fund",
                     url: "https://docs.google.com/forms/d/e/1FAIpQLSezda8g9qtdwXCRn4OfXG1SuoX0RfBkB4SfmLevrKVo16wHcQ/viewform",
                     city: "Los Angeles"),
            BailFund(name: "Orange County Bail Fund",
                     url: "https://www.gofundme.com/f/orange-county-bail-fund",
                     city: "Orange County"),
            BailFund(name: "DeDe McClure Bail Fund Fundraiser",
                     url: "https://www.gofundme.com/f/in-solidarity-with-Protestors",
                     city: "San Diego"),
          ]),
    StateStruct(state: "Colorado",
          bailFunds: [
            BailFund(name: "Colorado Freedom Fund",
                     url: "https://fundly.com/coloradofreedomd",
                     city: "Denver + surrounding area")
          ]),
    StateStruct(state: "Connecticut",
          bailFunds: [
            BailFund(name: "Connecticut Bail Fund",
                     url: "http://www.ctbailfund.org",
                     city: "State-wide")
          ]),
    StateStruct(state: "Delaware",
          bailFunds: [
            BailFund(name: "Wilmington Freedom Alliance",
                     url: "https://wilmingtonfreedomalliance.org",
                     city: "Wilmington")
          ]),
    StateStruct(state: "Florida",
          bailFunds: [
            BailFund(name: "Community Support Fund",
                     url: "https://www.gofundme.com/f/CommunitySupportFund",
                     city: "Duval County"),
            BailFund(name: "LGBTQ Freedom Fund",
                     url: "https://www.lgbtqfund.org/donate-1",
                     city: "Miami"),
          ]),
    StateStruct(state: "Georgia",
          bailFunds: [
            BailFund(name: "Atlanta Solidarity Fund",
                     url: "https://atlsolidarity.org/#support",
                     city: "Atlanta")
          ]),
    StateStruct(state: "Hawai'i",
          bailFunds: [
            BailFund(name: "Hawai'i Community Bail Fund",
                     url: "https://hawaiicommunitybailfund.org",
                     city: "State-wide")
          ]),

]
