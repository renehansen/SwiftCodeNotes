import Foundation

class GenericsTester {
    public static func Test() {
    
    }
    
    // MARK: Example of generic method
    
    static func mySwap<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }
    
    static func testSwap() {
        var numberA = 3
        var numberB = 5
        mySwap(&numberA, &numberB)
    }
    
    // MARK: Example of type constraint
    static func myMax<T: Comparable>(_ a: T, _ b: T) -> T {
        return a >= b ? a : b
    }
    
    static func testMyMax() {
        let a = 42, b = 5
        print("The greater of \(a) and \(b) is \(myMax(a, b))")
        
        let word1 = "monkey", word2 = "bar"
        print("The greater of \(word1) and \(word2) is \(myMax(word1, word2))")
    }
    
    // MARK: Test of generic type    
    static func testMyQueue() {
        let stringQueue = MyQueue<String>()
        stringQueue.enqueue("first")
        stringQueue.enqueue("second")
        var head: String? = stringQueue.dequeue()
        print("Head: \(head)")
        head = stringQueue.head
        print("Head: \(head)")        
    }
}

