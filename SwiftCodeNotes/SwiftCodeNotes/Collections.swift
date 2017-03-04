import Foundation

class Collections {
    static func test() {
        testArrays()
        testMultiDimensionalArrays()
        testSets()
        testDictionaries()
    }
    
    //MARK: - Arrays
    static func testArrays() {
        _ = Array<String>() //tomt array af strings
        _ = [String]() //tomt array af strings
        var initializedArray1: [String] = ["Rene", "Mette", "Trine"]
        var initializedArray2 = [String](repeating: "empty", count: 3)
        
        //append i 2 varianer
        initializedArray1.append("Mads")
        initializedArray1 += ["Pusser", "Morten"]
        
        //insert
        initializedArray2.insert("non-empty", at: 1) //empty, non-empty, empty, empty
        initializedArray2.removeFirst() //non-empty, empty, empty
        initializedArray2.removeLast() //non-empty, empty
        initializedArray2.remove(at: 1) //non-empty
        initializedArray2 += ["x", "y", "z"] //non-empty, x, y, z
        
        //erstat elementerne i range 0..2 - erstatningen behøver ikke være samme længde
        initializedArray2[0...2] = ["a", "b", "c", "d"] //a, b, c, d, z
    }
    
    static func testMultiDimensionalArrays() {
        //Swift understøtter ikke multi-dimensionelle arrays, men arrays af arrays. 
        
        var twoD: [[String]] = [["a", "b", "c"], ["x", "y", "z"]]
        twoD[0] = ["A", "B", "C"]
        twoD[0][0] = "@"
        print(twoD)
    }
    
    static func testSets() {
        let _: Set<String> = []
        let a: Set<String> = ["a", "a", "b", "c"] //duplik fjernet
        
        let b: Set<String> = ["a", "b"]
        
        print("Is \(a) a superset of \(b)?: \(a.isSuperset(of: b))")
        print("Is \(b) a subset of \(a)?: \(b.isSubset(of: a))")
        print("Elements only found in a: \(a.subtracting(b))")
        
        let c: Set<String> = ["b", "c", "d", "e"]
        print("All elements that are in the intersection of a and c: \(a.intersection(c))")
        print("All elements that are NOT in the intersection of a and c: \(a.symmetricDifference(c))")
        print("The union of a and c: \(a.union(c))")
    }
    
    static func testDictionaries() {
        let _: [Int: String] = [Int : String]()
        let _: [Int: String] = [:] //NB: Det er faktisk tilladt at erklære endnu en konstant '_'
        var httpStatus : [Int:String] = [ 200: "Ok", 404: "Not found"]
        httpStatus[500] = "Internal Server Error"
        
        if let prevNotFound = httpStatus.updateValue("No Such Thing", forKey: 404) {
            print("The old: '\(prevNotFound)' and the new: '\(httpStatus[404]!)'")
        }
        
        print("All http status codes:")
        for (code, message) in httpStatus {
            print("\(code) : \(message)")
        }
        
        httpStatus[404] = nil //fjerner hele entry
        httpStatus.removeValue(forKey: 500) //fjerner også hele entry
        print(httpStatus)
        let _ = httpStatus.keys
        let _ = httpStatus.values
        
    }
}
