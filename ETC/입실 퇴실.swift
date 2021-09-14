// 출처 : 프로그래머스 위클리 챌린지 7주차
// https://programmers.co.kr/learn/courses/30/lessons/86048
// 풀이 : hogumachu
// 너무 나이브 하게 푼 듯
// 단순하게 현재 퇴실이 가능하면 바로 퇴실하게 하였음
// 그렇지 않으면 일단 입실하고 만날 수 있는 값들을 최신화함

import Foundation

func solution(_ enter:[Int], _ leave:[Int]) -> [Int] {
    // 만날 수 있는 값들 저장
    var arr = Array(repeating: Array(repeating: false, count: enter.count + 1), count: enter.count + 1)
    // enter 에 대한 index
    var left = 0
    // leave 에 대한 index
    var right = 0
    // 현재 입실한 사람 저장용
    var now: [Int] = []

    // 반복
    while left < enter.count || right < leave.count {
        // 만약에 퇴실가능한 사람이 있으면
        if now.contains(leave[right]) {
            // 퇴실함
            now.remove(at: now.firstIndex(of: leave[right])!)
            right += 1
        // 그렇지 않으면 (퇴실 가능한 사람이 없으면)
        } else {
            // 입실하고
            now.append(enter[left])
            left += 1
            // arr 을 최신화함
            for i in 0..<now.count {
                for j in i..<now.count {
                    arr[now[i]][now[j]] = true
                    arr[now[j]][now[i]] = true
                }
            }
        }
    }

    // 결과 저장용
    var result: [Int] = Array(repeating: 0, count: enter.count)

    // 값들 저장함
    for i in 1..<arr.count {
        result[i - 1] = arr[i].filter { $0 }.count - 1
    }

    return result
}
