// 출처 : 프로그래머스 완전탐색 모의고사
// https://programmers.co.kr/learn/courses/30/lessons/42840
// 풀이 : hogumachu

func solution(_ answers:[Int]) -> [Int] {
    let firstRule = [1,2,3,4,5], secondRule = [2,1,2,3,2,4,2,5], thirdRule = [3,3,1,1,2,2,4,4,5,5]
    var firstIndex = 0, secondIndex = 0, thirdIndex = 0
    var score: [(Int, Int)] = [(0, 1), (0, 2), (0, 3)]
    var result: [Int] = []
    for answer in answers {
        if firstRule[firstIndex] == answer {
            score[0].0 += 1
        }
        if secondRule[secondIndex] == answer {
            score[1].0 += 1
        }
        if thirdRule[thirdIndex] == answer {
            score[2].0 += 1
        }
        firstIndex += 1
        secondIndex += 1
        thirdIndex += 1
        if firstIndex == firstRule.count {
            firstIndex = 0
        }
        if secondIndex == secondRule.count {
            secondIndex = 0
        }
        if thirdIndex == thirdRule.count {
            thirdIndex = 0
        }
    }
    score.sort(by: {$0.0 > $1.0})
    result.append(score[0].1)
    for i in 1...2 {
        if score[i].0 == score[0].0 {
            result.append(score[i].1)
        }
    }
    return result
}
