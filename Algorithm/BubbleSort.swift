import Foundation

func bubleSort (A: [Int]) -> [Int] {
    var array: [Int] = A
    for _ in 0..<array.count {
        for j in 1..<array.count {
            if array[j] < array[j-1] {
                let temp = array[j]
                array[j] = array[j-1]
                array[j-1] = temp
            }
        }
    }
    return array
}
