import Foundation

struct GenericsTester: Testable {
    public func test() {
        let fundamentals = GenericsFundamentals()
        fundamentals.testSwap()
        fundamentals.testMyMax()
        fundamentals.testMyQueue()
        AssociatedTypesTester().test()
        GenericsInheritanceTester().test()
    }    
}

