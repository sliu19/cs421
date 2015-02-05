#lang racket
(require srfi/1)

;;;Problem 1
(define pi 3.14159)

;;;Problem 2
(define (piFunc)
  pi)

;;;Problem 3
(define (simpleFun num)
  (* (+ 3 num) 4))

;;;Problem 4
(define (mediumFun num)
  (write "CS")
  (write "421")
  (+ num 3))

;;;Problem 5
(define (hardFun num)
  (if (> 0 num)
      "a"
      (if (< 0 num)
          "c"
          "b")))

;;;Problem 6
(define (recFun list num)
  (if (null? list)
      '()
      (cons (+ num (car list))
             (recFun (cdr list) (+ 1 num)))))

;;;Problem 7
(define simpleCurry
  (lambda (num1)
    (lambda (num2)
      (lambda (num3) (* num1 (+ num2 num3))))))

;;;Problem 8
(define oneCurry
  (simpleCurry 3))

;;;Problem 9
(define (myAdd1 list)
  (map add1 list))

;;;Problem 10
(define myFlexAdd1 (lambda vars
  (myAdd1 vars)))
