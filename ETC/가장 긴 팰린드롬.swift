// 출처 : 프로그래머스 연습문제 가장 긴 팰린드롬
// https://programmers.co.kr/learn/courses/30/lessons/12904
// 풀이 : hogumachu

import Foundation

func solution(_ s:String) -> Int {
    let arr = Array(s)

    for i in stride(from: arr.count, through: 2, by: -1) {
        for j in 0..<arr.count {
            if j + i - 1 >= arr.count {
                break
            }
            var left = j
            var right = j + i - 1
            var count = 0
            var finished = true
            while count <= i / 2 - 1 {
                if arr[left] != arr[right] {
                    finished = false
                    break
                }
                count += 1
                left += 1
                right -= 1
            }

            if finished {
                return i
            }
        }
    }
    return 1
}
