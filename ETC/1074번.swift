// 출처 : 백준 Z
// https://www.acmicpc.net/problem/1074
// 풀이 : hogumachu

import Foundation


func visit(_ size: Int, _ startX: Int, _ endX: Int, _ startY: Int, _ endY: Int) -> Void {

    if size == 1 {
        if startX == input[1], startY == input[2] {
            print(count)
        }
        count += 1
    } else {
        if input[1] >= startX, input[1] <= startX + size/2 - 1 {
            if input[2] >= startY, input[2] <= startY + size/2 - 1 {
                visit(size/2, startX, startX + size/2 - 1, startY, startY + size/2 - 1)


            } else {
                count += (size * size)/4
                visit(size/2, startX, startX + size/2 - 1, startY + size/2, endY)

            }
        } else {
            if input[2] >= startY, input[2] <= startY + size/2 - 1 {
                count += (size * size)/2
                visit(size/2, startX + size/2, endX, startY, startY + size/2 - 1)

            } else {
                count += ((3 * size * size) / 4)
                visit(size/2, startX + size/2, endX, startY + size/2, endY)
            }
        }




    }
}

func power (_ pow: Int) -> Int {
    var r = 2

    if pow == 0 {
        return 1
    } else if pow == 1{
        return 2
    } else {
        for _ in 2...pow {
            r *= 2
        }
        return r
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}



let size = power(input[0])
var count = 0

visit(size, 0, size-1, 0, size-1)
