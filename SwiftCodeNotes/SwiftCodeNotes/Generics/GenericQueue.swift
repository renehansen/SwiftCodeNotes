import Foundation

public class GenericQueue<T> {
    fileprivate var elements = [T]()
    
    public func enqueue(_ element: T) {
        elements.append(element)
    }
    
    public func dequeue() -> T? {
        if !elements.isEmpty {
            elements.remove(at: 0)
        }
        return head
    }
    
    public var head: T? {
        return elements.first
    }
}

extension GenericQueue {
    //We have access to the type parameter in the extension
    public var second: T? {
        if elements.count >= 2 {
            return elements[1]
        }
        return nil
    }
}
