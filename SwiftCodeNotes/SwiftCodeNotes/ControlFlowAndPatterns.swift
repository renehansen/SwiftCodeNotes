import Foundation

class ControlFlowAndPatterns {
    static func test() {
        testLoops()
        testRangesAndIntervals()
        testPatternsWithSwitch()
        testPatternsWithTuples()
        testPatternsWithEnums()
        testOptionalImpl()
        testGuard()
    }
    
    static func testLoops() {
        let list = [1, 2, 3, 4]
        
        for _ in list { }
        
        for _ in 0..<list.count { }
        
        for i in 1...5 {
            print(i * 3)
        }
        
        let airports = ["STD": "Stanstead", "AAR": "Aarhus"]
        for (code, name) in airports {
            print("Code: \(code), Name: \(name)")
        }
        
        var x = 0
        repeat {
            x += 1
        }
        while x < 5
        
        //label
        whileLabel: while (x < 10) {
            x += 1
            if (x % 2 == 0) {
                break whileLabel
            }
            else {
                continue whileLabel
            }
        }
    }
    
    static func testRangesAndIntervals() {
        //http://oleb.net/blog/2015/09/swift-ranges-and-intervals/
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        _ = numbers[1..<5] //[2, 3, 4, 5]
    }
    
    static func testPatternsWithSwitch() {
        let char: Character = "5"
        switch char {
        case "a", "e", "i", "o", "u":
            print("'\(char)' is a wovel")
        case "0"..."9":
            print("\(char) is a digit")
        case "a"..."z":
            fallthrough
        default:
            print("'\(char)' is a consonant")
        }
        
        let animal = "bee"
        switch animal {
        case "aardwark"..."antelope":
            print("An A-animal")
        case "baboon"..."bushbuck":
            print("A B-animal")
        case "caiman"..."curlew":
            print("A C-animal")
        default:
            print("Some other animal")
        }
    }
    
    static func testPatternsWithTuples() {
        let xy = getRandomTwoIntTuple()
        switch xy {
        case (let x, 10):
            print("Y is known to be 10 and x is \(x)")
        case (5, let y):
            print("X is known to be 5 and y is \(y)")
        case let (x, _) where x >= 6:
            print("X is greater than 6")
        case let (x, y):
            print("Default: X is \(x) and Y is \(y)")
        }
        
        //let rgbaColor = (r: 0.5, g: 0.5, b: 0.5, a: 1.0)
        let r = 0.5, g = 0.5, b = 0.1, a = 1.0
        //switch rgbaColor {
        switch (r, g, b, a) { //her konstruerer vi tuplen ud fra variable
        case (1.0, 1.0, 1.0, 1.0):
            print("White")
        case let (r, g, b, 1.0) where r == g && g == b:
            print("Grey")
        case (0.0, 0.5...1.0, let b, _):
            print("Blue is \(b)")
        default:
            break //ja, i Swift breaker man ud af ifs
        }
    }
    
    static func testPatternsWithEnums() {
        let myStatus = Status.ok(status: 0)
        switch myStatus {
        case .na: break
        case .ok(0): break
        case .ok(1...10): break
        case .ok: break
        default: break
        }
        
        //test med nested enum
        let conn = getRandomConnectionStatus()
        switch conn {
        case .down(Status.ok(status: 0...4)): break
        case .up(Status.ok(let nestedStatus)) where nestedStatus >= 0 && nestedStatus <= 4:
            print(nestedStatus)
        case .up(Status.error(code: 42, message: "abe"..."kat")): break
        default: break
        }
    }

    enum Status {
        case ok(status: Int)
        case error(code: Int, message: String)
        case na
    }
    
    //Nested enum
    enum ConnectionStatus {
        case down(Status)
        case up(Status)
    }
    
    static func testOptionalImpl() {
        func getOptionalInt() -> Int? {
            return 10
        }
        func getOptionalImpl() -> OptionalImpl {
            return OptionalImpl.some(value: 10)
        }
        
        let optional1 = getOptionalImpl()
        switch optional1 {
        case .some(let val) where val > 0: print(val)
        case .none: print("The optional is nil")
        default: break
        }
        
        //Bemærk: PRÆCIS samme implementation med indbygget optional som OptionalImpl
        let optional2 = getOptionalInt()
        switch optional2 {
        case .some(let val) where val > 0: print(val)
        case .none: print("The optional is nil")
        default: break
        }
        
        //Samme semantik (val? kom til i Swift 2)
        let optional3 = getOptionalInt()
        switch optional3 {
        case let val? where val > 0: print(val)
        case nil: print("The optional is nil")
        default: break
        }
        
        //Husk let cur? svarer til .Some(let cur)
        let optionals: [Int?] = [1, nil, 3, 4, 5, 6]
        for case let cur? in optionals where cur < 4 {
            print(cur)
        }
        let optionals2: [Int?] = [1, nil, 3, 4, 5, 6]
        for case .some(let cur) in optionals2 where cur < 4 {
            print(cur)
        }
    }
    
    static func testGuard() {
        let x: Int? = 7, y: Int? = 15
        guard let checkedX = x, let checkedY = y, checkedX > 5 && checkedX < 10 else {
            print("Invalid x or y")
            return
        }
        
        print("CheckedX + CheckedY = \(checkedX + checkedY)")
    }
    
    
    enum OptionalImpl {
        case none
        case some(value: Int)
        
        mutating func setNil() {
            self = .none
        }
        mutating func setValue(_ value: Int) {
            self = .some(value: value)
        }
        func getValue() -> Int {
            switch self {
                case .none: fatalError("Nil optional")
                case .some(let value): return value
            }
        }
    }
    
    fileprivate static func getRandomTwoIntTuple() -> (Int, Int) {
        return (7, 11)
    }
    
    fileprivate static func getRandomConnectionStatus() -> ConnectionStatus {
        return ConnectionStatus.down(Status.ok(status: 5))
    }
}
	
