// 출처 : 백준 최단경로
// https://www.acmicpc.net/problem/1753
// 풀이 : hogumachu
// (시간 초과 - 다시 풀기)

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let v = input[0], e = input[1]
    let startVertex = Int(readLine()!)!
    var result: [Int] = Array(repeating: 10000000, count: v+1)
    var edges: [[(Int, Int)]] = Array(repeating: [], count: v+1)
    var queue = priorityQueue<Int>()
    for _ in 0..<e {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
//        if value[0] == startVertex && (result[value[1]] == -1 || result[value[1]] > value[2]) {
//            queue.insert(value[2], value[1])
//        }
        edges[value[0]].append((value[1],value[2]))
    }
    queue.insert(0, startVertex)
    while !queue.isEmpty() {
        let minValue = queue.remove()!
        if result[minValue.1] > minValue.0{
            result[minValue.1] = minValue.0
            for value in edges[minValue.1] {
                if result[value.0] > value.1 + minValue.0 {
                    queue.insert(value.1 + minValue.0, value.0)
                }
            }
        }
    }

    for i in 1...v {
        if result[i] == 10000000 {
            print("INF")
        } else {
            print(result[i])
        }
    }
}

solution()


struct priorityQueue<T: Comparable> {
    var array: [(T, T)] = []
    // array[i].0 이 가중치이고 array[i].1 이 vertex 번호
    mutating func remove() -> (T, T)? {
        if array.isEmpty {
            return nil
        } else if array.count == 1 {
            return array.removeLast()
        } else {
            array.swapAt(0, array.count-1)
            let returnValue = array.removeLast()
            var index = 0

            while index < array.count {
                if index * 2 + 2 < array.count {
                    if array[index].0 > array[index*2+2].0 {
                        if array[index].0 > array[index*2+1].0 {
                            if array[index*2+1].0 > array[index*2+2].0 {
                                array.swapAt(index, index*2+2)
                                index = index*2+2
                            } else {
                                array.swapAt(index, index*2+1)
                                index = index*2+1
                            }
                        } else {
                            array.swapAt(index, index*2+2)
                            index = index*2+2
                        }
                    } else if array[index].0 > array[index*2+1].0 {
                        array.swapAt(index, index*2+1)
                        index = index*2+1
                    }
                } else if index * 2 + 1 < array.count {
                    if array[index].0 > array[index*2+1].0 {
                        array.swapAt(index, index*2+1)
                        index = index*2+1
                    }
                } else {
                    break
                }
            }
            return returnValue
        }
    }

    mutating func insert(_ x: T, _ y: T) -> Void {
        array.append((x,y))
        if array.count == 1 {
            return
        }
        var index = array.count-1
        while index > 0 {
            if index%2 == 1 {
                if array[index].0 < array[index/2].0 {
                    array.swapAt(index, index/2)
                    index = index/2
                } else {
                    break
                }
            } else {
                if array[index].0 < array[index/2-1].0 {
                    array.swapAt(index, index/2-1)
                    index = index/2-1
                } else {
                    break
                }
            }
        }
    }

    func isEmpty() -> Bool {
        return array.isEmpty
    }

}
