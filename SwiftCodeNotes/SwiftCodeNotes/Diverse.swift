import Foundation

class Diverse {
    static func test() {
        let chamber = CombustionChamberStatus(temperatureCelsius: 32, pressureAtmospheric: 0.96)
        print(chamber)
    }
    
    static func max<T>(_ a: T, b: T) -> T where T:Comparable {
        return a > b ? a : b
    }
}

struct MyPoint: Equatable {
    fileprivate var x, y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

func ==(lhs: MyPoint, rhs: MyPoint) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

struct CombustionChamberStatus {
    var temperatureKelvin: Double
    var pressureKiloPascals: Double
    
    init(temperatureKelvin: Double, pressureKiloPascals: Double) {
        print("Phase 1 init")
        self.temperatureKelvin = temperatureKelvin
        self.pressureKiloPascals = pressureKiloPascals
        print("CombustionChamberStatus fully initialized")
        print("Phase 2 init")
    }
    
    init(temperatureCelsius: Double, pressureAtmospheric: Double) {
        print("Phase 1 delegating init")
        let temperatureKelvin = temperatureCelsius + 273.15
        let pressureKiloPascals = pressureAtmospheric * 101.325
        self.init(temperatureKelvin: temperatureKelvin, pressureKiloPascals: pressureKiloPascals)
        print("Phase 2 delegating init")
    }
}
