// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 순위 검색
// https://programmers.co.kr/learn/courses/30/lessons/72412
// 풀이 : hogumachu
// dict에 모든 케이스를 저장함
// 처음에는 query 를 불러올 때 마다 dict에 있는 값을 sort 하였는데 시간 초과
// 따라서 먼저 sort 를 하고 진행
// 값을 찾을 때도 이분 탐색으로 진행해야 시간 초과 나지 않음.


import Foundation

func solution(_ infos: [String], _ query: [String]) -> [Int] {
    var dict: [String: [Int]] = [:]

    for info in infos {
        let arr = info.split(separator: " ")
        let a = [arr[0], "-"]
        let b = [arr[1], "-"]
        let c = [arr[2], "-"]
        let d = [arr[3], "-"]

        for i in a {
            for j in b {
                for x in c {
                    for y in d {
                        if dict["\(i)\(j)\(x)\(y)"] != nil {
                            dict["\(i)\(j)\(x)\(y)"]!.append(Int(arr[4])!)
                        } else {
                            dict["\(i)\(j)\(x)\(y)"] = [Int(arr[4])!]
                        }
                    }
                }
            }
        }
    }

    for key in dict.keys {
        dict[key] = dict[key]!.sorted()
    }

    var result: [Int] = Array(repeating: 0, count: query.count)

    for i in 0..<query.count {
        var order = query[i].split(separator: " ")
        let num = Int(order[7])!
        let str = "\(order[0])\(order[2])\(order[4])\(order[6])"

        if dict[str] != nil {
            let dArr = dict[str]!
            var left = 0
            var right = dArr.count - 1
            var mid = 0
            while left <= right {
                mid = (left + right) / 2
                if dArr[mid] < num {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            result[i] = dArr.count - left
        }
    }
    return result
}
