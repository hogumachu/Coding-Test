// 출처 : 백준 바이러스
// https://www.acmicpc.net/problem/2606
// 풀이 : hogumachu

import Foundation

class computer {
    let serialNumber: Int
    var connectedComputer: [computer] = []
    var isVisit = false
    
    init( _ num: Int) {
        self.serialNumber = num
    }
}

let howManyComputer = Int(readLine()!)!

let forRepeat = Int(readLine()!)!

var computers: [Int:computer] = [:]

var result = -1
for i in 1...howManyComputer {
    computers.updateValue(computer(i), forKey: i)
}

for _ in 0..<forRepeat {
    let read = readLine()!.split(separator: " ").map{Int(String($0))!}

    if computers[read[0]]!.connectedComputer.contains(where: {$0.serialNumber == read[1]}) == false {
        computers[read[0]]!.connectedComputer.append(computers[read[1]]!)
    }
    if computers[read[1]]!.connectedComputer.contains(where: {$0.serialNumber == read[0]}) == false {
        computers[read[1]]!.connectedComputer.append(computers[read[0]]!)
    }
}

func visit( _ num: Int) -> Void {

    if computers[num] != nil {
        if computers[num]!.isVisit == false {
            result += 1
            computers[num]!.isVisit = true
            for connectedCom in computers[num]!.connectedComputer {
                visit(connectedCom.serialNumber)
            }
        }
    }
}

visit(1)

print(result)
