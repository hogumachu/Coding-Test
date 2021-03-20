// 출처 : 백준 백설 공주와 일곱 난쟁이
// https://www.acmicpc.net/problem/3040
// 풀이 : hogumachu
// 일곱 난쟁이의 총합이 100 이므로
// 아홉 난쟁이의 총합에 100을 빼면
// 일곱 난쟁이가 아닌 다른 두 난쟁이의 합이 나옴
// 그것을 이용하여 품

import Foundation

func solution() -> Void {
    var sum = -100
    var dwarf: [Int] = []
    var removeDwarf: [Int] = []

    for _ in 1...9 {
        let temp = Int(readLine()!)!
        dwarf.append(temp)
        sum += temp
    }
    for i in 0..<dwarf.count {
        if dwarf.contains(sum - dwarf[i]) == true {
            removeDwarf.append(dwarf[i])
            removeDwarf.append(sum - dwarf[i])
            break
        }
    }
    for dwf in dwarf {
        if removeDwarf.contains(dwf) == false {
            print(dwf)
        }
    }

}
solution()
