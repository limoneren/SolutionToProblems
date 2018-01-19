// Solution 2
// Eren Limon

class Node {
    // I extended the Node class by adding helper methods to create test cases easily.
    
    var value: Int? = nil
    var next: Node? = nil
    
    init(value: Int?){
        self.value = value
    }
    
    func insertNext(value: Int?){
        let next = Node(value: value)
        self.next = next
    }

}

// Solution function
func containsCycle(node: Node) -> Bool{
    var result: Bool = false
    var visited: [Node] = []
    var currentNode: Node? = node
    while currentNode != nil && !result {
        visited.append(currentNode!)
        if visited.count > 1 {
            for i in 0...visited.count-2 {
                if result {
                    break
                }
                for j in (i+1)...visited.count-1 {
                    
                    if result {
                        break
                    }
                    if visited[i] === visited[j]{
                        result = true
                    }
                }
            }
        }
        
        currentNode = currentNode!.next
    }
    return result
  
}

// Test Cases

// Test case 1
var head = Node(value: 1);
var tail = Node(value: 2);
head.next = tail;
tail.next = head;
print(containsCycle(node: head))

// Test case 2
var head2 = Node(value: 1);
var box1 = Node(value: 2);
var box2 = Node(value: 3);
var box3 = Node(value: 4);
head2.next = box1
box1.next = box2
box2.next = box3
box3.next = box2
print(containsCycle(node: head2))

// Test case 3
var head3 = Node(value: 1)
var samp1 = Node(value: 2);
var samp2 = Node(value: 3);
var samp3 = Node(value: 4);
head3.next = samp1
samp1.next = samp2
samp2.next = samp3
print(containsCycle(node: head3))
