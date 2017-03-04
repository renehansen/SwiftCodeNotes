import Foundation

print("Hello, World!")
//Optionals.test()
//Collections.test()
//EnumsAndTuples.test()
//ControlFlowAndPatterns.test()

let testsToRun: [Testable] = [
    GenericsTester()
]
testsToRun.forEach{ $0.test() }
