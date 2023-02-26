/*
You are given an m x n integer matrix matrix with the following two properties:

Each row is sorted in non-decreasing order.
The first integer of each row is greater than the last integer of the previous row.
Given an integer target, return true if target is in matrix or false otherwise.

You must write a solution in O(log(m * n)) time complexity.

Example 1:


Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true

Example 2:

Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
Output: false

Constraints:

m == matrix.length
n == matrix[i].length
1 <= m, n <= 100
-10^4 <= matrix[i][j], target <= 10^4
*/

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let m = matrix.count, n = matrix[0].count
    guard m > 0 else { return false }
    var startIdx = 0, endIdx = n * m - 1
    while startIdx <= endIdx {
        let midIdx = startIdx + (endIdx - startIdx) / 2
        let (row, col) = (midIdx / n, midIdx % n)
        let value = matrix[row][col]
        if value == target { 
            return true
        } else if value < target {
            startIdx = midIdx + 1
        } else {
            endIdx = midIdx - 1
        }
    }
    return false
}