import Foundation

enum CompassPoint {
    case north
    case south, east, west
}

//Enum with associated values
enum PostalCode {
    case us(Int, Int)
    case uk(String)
    case ca(code: String)
    case dk(String)
}

enum TeenYears: Int {
    case thirteen = 13, fourteen
    //Fortsætter ...
    case fifteen, sixteen, seventeen, eighteen, nineteen
}

//Elementernes rå værdi er en character
//En enum er i bund og grund en Struct med et rawValue felt (og et fixed antal konstanter)
enum ASCIIControls: Character {
    case newline = "\n"
    case carriage = "\r"
    case tab = "\t"
}

enum Dimension {
    //én måde at initialisere på
    case distance(Int)
    
    //Anden måde at initialisere på - potentiel gotcha hvis man introducerer en init! (se brug)
    init(distance: Int) {
        //GOTCHA: Lav ALDRIG noget andet end default-initializeren -> forskellige resultater afhængig af init tilgang
        self = .distance(distance + 100)
    }
    
    func tripleValue() -> Int {
        switch self {
        case .distance(let value): return value * 3
        }
    }
}

enum StateMachine {
    case closed, opening, open, closing
    
    mutating func next() -> StateMachine {
        switch self {
        case .closed:   self = .opening
        case .opening:  self = .open
        case .open:     self = .closing
        case .closing:  self = .closed
        }
        return self
    }
}

class EnumsAndTuples {
    static func test() {
        testTuples()
        testEnums()
    }
    
    internal static func testTuples() {
        //Via klasse
        let _ = [
            VerboseHttpStatus(statusCode: 200, description: "Ok"),
            VerboseHttpStatus(statusCode: 404, description: "Not found")
        ]
        
        let tupleHttpStatii = [
            (200, "Ok"),
            (404, "Not found"),
            (500, "Internal Server Error")
        ]
        
        //Bruger navngivne tuple-elementer
        let _: [(code: Int, description: String)] = [(code: 100, description: "noget")]
        let tupleHttpStatii2 = [
            (code: 200, description: "Ok"),
            (code: 404, description: "Not found"),
            (code: 500, description: "Internal Server Error")
        ]
        
        let firstTuple = tupleHttpStatii[0]
        //Unavngiven tilgang kan bruges når Tuple elementer ikke er navngivne
        let firstCode = firstTuple.0
        let firstDescription = firstTuple.1
        print("First tuple: \(firstCode) : \(firstDescription)")
        
        let (sndCode, sndDescription) = tupleHttpStatii[1]
        print("Second tuple: \(sndCode): \(sndDescription)")
        
        let (thirdCode, _) = tupleHttpStatii[2]
        print("Third status code \(thirdCode)")
        
        //Henter navngivent tuple-element ud
        let namedTuple = tupleHttpStatii2[0]
        print("Navngiven tuple: \(namedTuple.code): \(namedTuple.description)")
        //man BEHØVER dog ikke bruge de navngivne elementer
        let (c, _) = tupleHttpStatii2[1]
        print(c)
    }
    
    internal static func testEnums() {
        checkCompassPoint(getRandomCompassPoint())
        
        checkZipCode(getRandomZipCode())
        
        checkTeenYears()
        
        checkDimension()
        
        checkStateMachine()
    }
    
    fileprivate static func getRandomCompassPoint() -> CompassPoint {
        return .south
    }
    
    fileprivate static func checkCompassPoint(_ direction: CompassPoint) {
        switch direction {
        case  .south: print("We are going south")
        default: print("We are not going south")
        }
    }
    
    fileprivate static func getRandomZipCode() -> PostalCode {
        var zip = PostalCode.us(42, 1977)
        zip = .uk("UK-99")
        zip = .ca(code: "CANOOK")
        zip = .dk("8900")
        return zip
    }
    
    fileprivate static func checkZipCode(_ zip: PostalCode) {
        switch zip {
        case .us(let cityCode, _):
            print("\(zip) is a US postal code and the city-part is \(cityCode)")
        case .uk (let ukZip):
            print("\(ukZip) is a UK zip code")
        case .ca: //Behøver ikke bruge associated value
            print("This is a canadian code")
        case .dk("8950"):
            print("Det her sker i Ørsted")
        case .dk:
            print("Det her sker et andet sted i Danmark")
        }
    }
    
    fileprivate static func checkTeenYears() {
        let t3 = TeenYears.fifteen
        print("Den rå værdi af \(t3) er \(t3.rawValue)")
        if let eighteen = TeenYears(rawValue: 18) { //enum fra rå værdi
            print(eighteen)
            if let _ = TeenYears(rawValue: eighteen.rawValue + 2) {
                print("This is not gonna happen")
            }
            else {
                print("Cannot construct a valid TeenYears element from the raw value 20")
            }
        }
    }
    
    fileprivate static func checkDimension() {
        let dim1 = Dimension(distance: 10)
        let dim2 = Dimension.distance(10)
        print("BEWARE! - diskrepans afhængig af initialiseringstilgang")
        print("- Dimension(distance: 10) giver \(dim1)")
        print("- Dimension.DISTANCE(10) giver \(dim2)")
        
        print(dim1.tripleValue())
    }
    
    fileprivate static func checkStateMachine() {
        var state = StateMachine.closed
        print(state.next())
        print(state.next())
        print(state.next())
        print(state.next())
    }
}

//Skal se at tuple er et mere elegant alternativ
class VerboseHttpStatus {
    var statusCode: Int
    var description: String
    
    init(statusCode: Int, description: String) {
        self.statusCode = statusCode
        self.description = description
    }
}


