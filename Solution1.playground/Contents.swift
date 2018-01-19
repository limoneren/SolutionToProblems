// Solution 1
// Eren Limon

class Node {
    // I extended the Node class by adding helper methods to create test cases easily.
    
    var value: Int? = nil
    var leftChild: Node? = nil
    var rightChild: Node? = nil
    
    init(value: Int?){
        self.value = value
    }
    
    func addLeftChild(value: Int?){
        let left = Node(value: value)
        self.leftChild = left
    }
    
    func addRightChild(value: Int?){
        let right = Node(value: value)
        self.rightChild = right
    }
    
}

/* My solution creates an array of elements in the binary tree in an inordered fashion
   and checks the array from the beginning */

// Helper function
func binaryTreeToList(node: Node) ->[Int]{
    var orderedVersion: [Int] = []
    binaryTreeToListHelper(node: node, list: &orderedVersion)
    return orderedVersion
}

// Helper function
func binaryTreeToListHelper(node: Node, list: inout [Int]){
    if let leftChild = node.leftChild {
        binaryTreeToListHelper(node: leftChild, list: &list)
    }
    if let valueOfNode = node.value {
        list.append(valueOfNode)
    }
    if let rightChild = node.rightChild {
        binaryTreeToListHelper(node: rightChild, list: &list)
    }
}

// Solution function
func isBinaryTree(node: Node) -> Bool{
    var result: Bool = true
    var ordered: [Int] = binaryTreeToList(node: node)
    for (index, _) in ordered.enumerated() {
        if index > 0{
            if ordered[index] < ordered[index-1]{
                result = false
            }
        }
        
    }
    return result
}

// Test Cases

// Test case 1
var root = Node(value: 10)
root.addLeftChild(value: 9)
root.addRightChild(value: 11)
//      10
//     /  \
//    9   11

// Test case 2
var root2 = Node(value: 10)
root2.addLeftChild(value: 9)
root2.addRightChild(value: 11)
root2.leftChild?.addLeftChild(value: 8)
root2.leftChild?.addRightChild(value: 11)
//       10
//      /  \
//     9   11
//    / \
//   8  11

// Test case 3
var root3 = Node(value: 10)
root3.addLeftChild(value: 8)
root3.addRightChild(value: 12)
root3.leftChild?.addLeftChild(value: 7)
root3.leftChild?.addRightChild(value: 9)
root3.rightChild?.addLeftChild(value: 11)
root3.rightChild?.addRightChild(value: 13)
//       10
//      /  \
//     8   12
//    / \  / \
//   7  9 11 13


print (isBinaryTree(node: root))
print (isBinaryTree(node: root2))
print (isBinaryTree(node: root3))


/* More efficient version can be done by changing 2 things:
 1) We can get rid of the storage data structure and gain from the space
 2) We can stop checking as soon as we come across with a contradictory subtree */
