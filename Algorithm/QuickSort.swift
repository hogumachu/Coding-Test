import Foundation

func quickSort(_ array: [Int]) -> [Int] {

    if array.count <= 1 {
        return array
    }
    let pivot = array[0]
    let left = array.filter { $0 < pivot }
    let medium = array.filter { $0 == pivot }
    let right = array.filter { $0 > pivot }

    return quickSort(left) + medium + quickSort(right)
}
