// 출처 : 프로그래머스 이분탐색 입국심사
// https://programmers.co.kr/learn/courses/30/lessons/43238
// 풀이 : hogumachu
// 단순한 이분탐색 문제
// 시간을 기준으로 그 시간동안 n명을 모두 검사할 수 있다면 right 값을 줄이고
// 그렇지 못하면 left 값을 올림
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    // 초기 left, right 값
    var left: Int64 = 1
    var right: Int64 = 1_000_000_000_000_000

    // 이진탐색
    func binarySearch(_ t: Int64) -> Bool {
        var sum: Int64 = 0
        for time in times {
            sum += (t / Int64(time))
            if sum >= n {
                break
            }
        }

        if sum >= n {
            return true
        } else {
            return false
        }
    }

    while left < right {
        let mid = (left + right) / 2

        if binarySearch(mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}
