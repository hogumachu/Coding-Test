// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [1차] 비밀지
// https://programmers.co.kr/learn/courses/30/lessons/12934
// 풀이 : hogumachu

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = Array(repeating: "", count: n)
    var arr: [[Int]] = Array(repeating: (Array(repeating: 0, count: n)), count: n)

    for i in 0..<arr1.count {
        var k: Int = arr1[i]
        var j: Int = n - 1
        while k > 0 {
            arr[i][j] = k%2
            k /= 2
            j -= 1
        }
    }

    for i in 0..<arr2.count {
        var k: Int = arr2[i]
        var j: Int = n - 1
        while k > 0 {
            if k%2 == 1{
                arr[i][j] = k%2
            }
            k /= 2
            j -= 1
        }
    }

    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            if arr[i][j] == 1 {
                answer[i] += "#"
            } else {
                answer[i] += " "
            }
        }
    }

    return answer
}
