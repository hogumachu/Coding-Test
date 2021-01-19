import Foundation

func split (_ array: [Int]) -> [Int] {

    if array.count <= 1 {
        return array
    }

    let medium = Int(array.count / 2)
    let leftArray = split(Array(array[0..<medium]))
    let rightArray = split(Array(array[medium...]))

    return merge(leftArray, rightArray)
}

func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
    var sortedArray: [Int] = []
    var lptr = 0
    var rptr = 0

    while leftArray.count > lptr, rightArray.count > rptr {
        if leftArray[lptr] > rightArray[rptr] {
            sortedArray.append(rightArray[rptr])
            rptr += 1
        } else {
            sortedArray.append(leftArray[lptr])
            lptr += 1
        }
    }

    while leftArray.count > lptr {
        sortedArray.append(leftArray[lptr])
        lptr += 1
    }

    while rightArray.count > rptr {
        sortedArray.append(rightArray[rptr])
        rptr += 1
    }

    return sortedArray
}

/*
let A: [Int] = [1,3,6,2,4,8,0,5,7]
print(split(A)) : [0, 1, 2, 3, 4, 5, 6, 7, 8]
print(A) : [1,3,6,2,4,8,0,5,7]
*/
