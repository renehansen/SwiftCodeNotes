import Foundation

struct GenericsInheritanceTester: Testable {
    public func test() {
        let openPair = Pair<Int, Double>(first: 42, second: 23.7)
        print("Open generic type w. first=\(openPair.first) and second=\(openPair.second)")
        
        //type parameters can be inferred
        let inferredPair = Pair(first: 12, second: "Hello World")
        print("Open generic type w. first=\(inferredPair.first) and second=\(inferredPair.second)")
        
        let closedPair = ClosedPair(first: 42, second: "forty-two")
        print("Closed generic type w. first = \(closedPair.first) and second = \(closedPair.second)")
        
        //Type parameter included for pedagogical purposes
        let semiClosedPair = SemiClosedPair<Double>(first: 17.5, second: "Hello World")
        print("Closed generic type w. first = \(semiClosedPair.first) and second = \(semiClosedPair.second)")
        
        let triple = TripleWithClosedParent(first: 42, second: 5.75, third: "Hello World")
        print("Triple which closes supertype and introduces yet another type parameter w. first = \(triple.first), second = \(triple.second), and third=\(triple.third)")        
    }
}

//Open generic type - call site supplies actual type parameters
class Pair<T1, T2> {
    var first: T1
    var second: T2
    
    init(first: T1, second: T2) {
        self.first = first
        self.second = second
    }
}

//Closed generic type - type parameters are closed to Int and String, respectively
class ClosedPair: Pair<Int, String> {
    
}

//Semi-closed - The second type parameter is closed while the first is open
class SemiClosedPair<T1>: Pair<T1, String> {

}

//Closes supertype and introduces yet another type parameter
class TripleWithClosedParent<T3>: Pair<Int, Double> {
    var third: T3
    
    init (first: Int, second: Double, third: T3) {
        self.third = third
        super.init(first: first, second: second)
    }
}
