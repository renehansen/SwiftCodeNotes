import Foundation

class Classes {

}

public class Person {
    private var _name: String = ""
    private var _age: Int = 0
    private var _weight: Double = 0.0
    private var _isPretty: Bool = false
    
    /*
    init() {
        
    }
    */
    
    public func name() -> String {
        return _name
    }
    
    public func setName(name: String) {
        self._name = name
    }
    
    public func age() -> Int {
        return _age
    }
    
    public func setAge(age: Int) {
        self._age = age
    }
    
    public func weight() -> Double {
        return _weight
    }
    
    public func setWeight(weight: Double) {
        self._weight = weight
    }
    
    public func isPretty() -> Bool {
        return _isPretty
    }
    
    public func setIsPretty(isPretty: Bool) {
        self._isPretty = isPretty
    }
}
