// 출처 : 프로그래머스 2019 카카오 개발자 겨울 인턴십 불량 사용자
// https://programmers.co.kr/learn/courses/30/lessons/64064
// 풀이 : hogumachu

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    // banned 로 가능한 user 의 index 를 저장하는 배열
    var indices: [[Int]] = Array(repeating: [], count: banned_id.count)
    // 결과를 저장할 Set
    var resultSet = Set<[Int]>()

    // a 와 b 를 비교하여 변경할 수 있는 지 없는지 판단
    func canConvert(_ a: String, _ b: String) -> Bool {
        let first = Array(a)
        let second = Array(b)

        for i in 0..<first.count {
            if first[i] != second[i] && second[i] != "*" {
                return false
            }
        }

        return true
    }

    // user 와 banned 를 비교하여 convert 할 수 있으면 indices 에 넣음
    for userIndex in 0..<user_id.count {
        for bannedIndex in 0..<banned_id.count {
            if user_id[userIndex].count == banned_id[bannedIndex].count {
                if canConvert(user_id[userIndex], banned_id[bannedIndex]) {
                    indices[bannedIndex].append(userIndex)
                }
            }
        }
    }

    // 중복되지 않은 값들을 방문함
    func visit(_ arr: [Int], _ next: Int) {
        if arr.count == banned_id.count {
            // 정렬을 하여 Set 에 넣으므로 중복되는 값들은 추가되지 않음
            resultSet.insert(arr.sorted())
        } else {
            if indices.count > next {
                for i in indices[next] {
                    if !arr.contains(i) {
                        visit(arr + [i], next + 1)
                    }
                }
            }
        }
    }

    // visit 초기 시작
    for i in indices[0] {
        visit([i], 1)
    }

    // Set 의 개수를 return
    return resultSet.count
}
