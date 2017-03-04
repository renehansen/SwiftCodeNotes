import Foundation

class Optionals {
    
    static func test() {
        
        print(" ----- OPTIONALS TEST -----")
        let optionalA = getOptionalInt(1)
        let optionalB = getOptionalInt(5)
        let optionalC = getOptionalInt(6)
        print("a = \(optionalA), b = \(optionalB), c = \(optionalC)")
        
        if
            let a = optionalA,
            let b = optionalB, b > a,
            let c = optionalC, c > b { //let er nødvendig her (let binder kun én gang)
                
                print("Det gælder at a < b < c")
                
                if a + b + c > 10, //NB: Bemærk komma
                    let d = getOptionalInt(), d + a < 15 {
                        print("Det gælder desuden at \(a) + \(b) + \(c) > 10 && \(d) + \(a) < 15")
                }
        }
        else {
            print("Nej for helvede!! Det gælder jo ikke at a < b < c")
        }
    }
    
    fileprivate static func getOptionalInt() -> Int? {
        return nil
    }
    
    fileprivate static func getOptionalInt(_ val: Int) -> Int? {
        return Optional(val)
    }    
}
