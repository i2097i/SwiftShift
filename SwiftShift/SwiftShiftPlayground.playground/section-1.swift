// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str = "SDFSDF"

println("something \(str)")

let something = 33

func isum(a : Int, b : Int) -> Int {
    return a + b
}

func fsum(a : Float, b : Float) -> Float {
    return a + b;
}

func multiply(a : Int, b : Int) -> Int {
    var result : Int = 0
    
    for var i = 0; i < b; i++ {
        result += a
    }
    
    return result
}

isum((Int)(13.4), 3)

fsum(13.4,3)

multiply(3, 12)

let possibleNumber = "1"


let convertedNumber = possibleNumber.toInt()



if convertedNumber {
    3
} else
{
    2
}

func returnMultipleValues() -> (v1: String, v2: String, v3: String) {
    return ("1","2","3")
}

let payload : (v1: String, v2: String, v3: String) = returnMultipleValues()
