import Foundation

struct GenericsFundamentals {
    // MARK: Example of generic method

    func mySwap<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }
        
    func testSwap() {
        var numberA = 3
        var numberB = 5
        mySwap(&numberA, &numberB)
    }

    // MARK: Example of type constraint
    func myMax<T: Comparable>(_ a: T, _ b: T) -> T {
        return a >= b ? a : b
    }

    func testMyMax() {
        let a = 42, b = 5
        print("The greater of \(a) and \(b) is \(myMax(a, b))")
        
        let word1 = "monkey", word2 = "bar"
        print("The greater of \(word1) and \(word2) is \(myMax(word1, word2))")
    }

    // MARK: Test of generic type
    func testMyQueue() {
        let stringQueue = GenericQueue<String>()
        stringQueue.enqueue("first")
        stringQueue.enqueue("second")
        var head: String = stringQueue.head!
        print("Head: \(head)")
        head = stringQueue.dequeue()!
        print("Head: \(head)")
    }
}
