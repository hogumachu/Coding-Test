// 출처 : 백준 숫자 카드
// https://www.acmicpc.net/problem/10815
// 풀이 : hogumachu
// 이진 탐색으로 시간을 줄여야 함

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let nCard = readLine()!.split(separator: " ").map{Int(String($0))!}
    let _ = Int(readLine()!)!
    let mCard = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = ""
    let sortedNCard = nCard.sorted()

    func binarySearch(_ start: Int, _ end: Int, _ x: Int) -> Bool {
        let mid = (start+end) / 2
        if sortedNCard[mid] == x {
            return true
        } else if end - start <= 1 {
            for i in start...end {
                if sortedNCard[i] == x {
                    return true
                }
            }
            return false
        } else if sortedNCard[mid] > x {
            return binarySearch(start, mid, x)
        } else {
            return binarySearch(mid+1, end, x)
        }
    }

    for i in mCard {
        binarySearch(0, n-1, i) ? (result += "1 ") : (result += "0 ")
    }
    print(result)
}

solution()
