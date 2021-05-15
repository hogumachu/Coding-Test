// 출처 : 백준 중복 빼고 정렬하기
// https://www.acmicpc.net/problem/10867
// 풀이 : hogumachu

import Foundation

func solution() {
    let _ = readLine()!
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    let soretedValue = value.sorted()
    var before = soretedValue[0]
    var result = "\(before) "

    for i in 1..<soretedValue.count {
        if soretedValue[i] == before {
            continue
        } else {
            result += "\(soretedValue[i]) "
            before = soretedValue[i]
        }
    }
    print(result)
}

solution()
