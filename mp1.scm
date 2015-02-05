#lang eopl
(require trace/calltrace-lib)

;;;Problem1
(define insert
  (lambda (myList num)
    (if(null? myList)
       (list num)
       (if (null? (cdr myList))
            (append (list (car myList)) (list num))
            (append (list (car myList)) (insert (cdr myList) num))))))

;;;Problem 2
(define insertAtN
  (lambda (myList index num)
    (if(null? myList)
       (list num)
       (if (< index 1)
           (append (list num) myList)
           (append (list (car myList)) (insertAtN (cdr myList) (- index 1) num))))))


;;;Problem 3 help
(define addSum
   (lambda (myList)
    (if (null? myList)
        0
        (+ (car myList) (addSum (cdr myList))))))

;;;Problem 3 
(define pairSums
  (lambda (myList)
    (if (null? myList)
        (list 0)
        (if (null? (cdr myList))
            (list (addSum (car myList)))
            (append (list (addSum (car myList))) (pairSums (cdr myList)))))))

;;;Problem 4
(define pairSum2
  (lambda (myList)
    (if (null? myList)
        (list 0)
        (if (null? (cdr myList))
            (list (apply + (car myList)))
            (append (list (apply + (car myList))) (pairSum2 (cdr myList)))))))

;;;Problem 5
(define funcMap
  (lambda (list1 list2)
    (if (null? list1)
        (map '() list1)
        (if (null? (cdr list1))
            (list (map (car list1) list2))
            (append (list (map (car list1) list2)) (funcMap (cdr list1) list2))))))

;;;Problem 6
(define makeSTree
  (lambda (val)
    (list val '() '())))

;;;Problem 7
(define insertLeaf
  (lambda(val tree)
    (if(null? tree)
       (makeSTree val)
       (if (< val (car tree))
           (list (car tree) (insertLeaf val (list-ref tree 1)) (list-ref tree 2))
           (list (car tree) (list-ref tree 1) (insertLeaf val (list-ref tree 2)))))))


;;;Problem 8
(define existBST
  (lambda (val tree)
    (cond
      ((null? tree) #f)
      ((eq? (car tree) val) #t)
      ((< val (car tree)) (existBST val (list-ref tree 1)))
      (else(existBST val (list-ref tree 2))))))

;;;Problem 9 
(define-datatype Stack Stack?
  (empty-stack)
  (nonempty-stack
   (datum number?)
   (rest Stack?)))

(define push
  (lambda (num stack)
      (nonempty-stack num stack)))    

(define pop
  (lambda (stack)
    (cases Stack stack
        (empty-stack() '())
        (nonempty-stack (val next) next))))

(define top
  (lambda (stack)
    (cases Stack stack
      (empty-stack() '())
      (nonempty-stack (num stack) num ))))



       
      
  


