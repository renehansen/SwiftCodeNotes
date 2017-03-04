import Foundation

final class TestAssociatedTypes {
    public static func Test() {
        let intContainer = IntContainer()
        intContainer.add(42)
        print("Int-value a index 0 = \(intContainer[0])")
        
        var stringContainer = GenericContainer<String>() //TODO RHA (move explation to structs: Necessary to specify as var, because we are using a mutating function
        stringContainer.add("Hello World")
        print("String-value at index 0 = \(stringContainer[0])")
    }
}

protocol Container {
    //conforming types will define what ElementType is
    associatedtype ElementType
    
    mutating func add(_ element: ElementType) //open for both structs and classes (TOOD RHA - move to protocols)
    
    var count: Int { get }
    
    subscript(i: Int) -> ElementType? { get }
}

class IntContainer: Container {
    // conformance to the Container protocol
    //The typealias is actually redundant as the compiler can infer the type from the implementation of add() and subscript()
    typealias ElementType = Int
    
    var elements = [Int]()
    
    func add(_ element: Int) {
        elements.append(element)
    }
    
    var count: Int {
        return elements.count
    }
    
    subscript(i: Int) -> Int? {
        if i < elements.count {
            return elements[i]
        }
        return nil
    }
}

//Conformance by generic type works the same
struct GenericContainer<T>: Container {
    //typealias ElementType = T redundant; inferred from implementation of protocol methods
    
    var elements = [T]()
    
    mutating func add(_ element: T) {
        elements.append(element)
    }
    var count: Int {
        return elements.count
    }
    
    subscript(i: Int) -> T? {
        if i < elements.count {
            return elements[i]
        }
        return elements[i]
    }
}

// - MARK: Generic Where clauses

func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ElementType == C2.ElementType, C1.ElementType: Equatable {
        
        if someContainer.count != anotherContainer.count {
            return false
        }
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        return true
}
