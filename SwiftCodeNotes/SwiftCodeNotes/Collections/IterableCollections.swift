import Foundation

struct IterableCollectionsTester: Testable {
    public func test() {
        testIterableStack()
        testCountdown()
    }
    
    private func testCountdown() {
        let countdown = Countdown(count: 3)
        print("About to iterate over countdown")
        for number in countdown {
            print(" - countdown number \(number)")
        }
    }
    
    private func testIterableStack() {
        var stack = IterableStack<Int>()
        stack.push(3)
        stack.push(6)
        stack.push(9)
        print("About to iterate through stack with three elements (3, 6, 9):")
        for element in stack {
            print(" - stack element: \(element)")
        }
    }
}

struct IterableStack<T>: Sequence {
    fileprivate var stackElements = [T]()
    
    func makeIterator() -> StackIterator<T> {
        return StackIterator(self)
    }
    
    mutating func push(_ element: T) {
        stackElements.append(element)
    }
}

struct StackIterator<T>: IteratorProtocol {
    private let stack: IterableStack<T>
    private var currentIndex: Int
    
    init(_ stack: IterableStack<T>) {
        self.stack = stack
        currentIndex = 0
    }
    
    mutating func next() -> T? {
        if currentIndex > stack.stackElements.count - 1 {
            return nil
        }
        let result = stack.stackElements[currentIndex]
        currentIndex += 1
        return result
    }
}

//Sequence with its own own iterator ( https://developer.apple.com/reference/swift/iteratorprotocol )
struct Countdown: Sequence, IteratorProtocol {
    var count: Int
    
    //Not necessary
    /*
     func makeIterator() -> Countdown {
     return self
     }
     */
    
    mutating func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
}
