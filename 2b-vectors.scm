;utility procedures

(define (square c) (* c c ) )

;defining vectors in  plane

(define (make-vector x y) (cons x y) )
(define xcor car)

(define xcor cdr)

;representing line segment

(define (make-seg x y) (cons x y) )

(define (seg-start s) ( car s) )

(define (seg-end s) (cdr s) )


;midpoint 

(define (midpoint s)
	(let (( a (seg-start s) )
	     ( b (seg-end s) )
	)
	(make-vector (average (xcor a)(xcor b) (average (ycor a) (ycor b) ) ) 
	)
	)
)


(define (length s)
	(let ( ( dx (- (xcor (seg-end s) ) 
		     (xcor (seg-beg s) )
		  ))
	      ( dy (- (ycor (seg-end s) )
		     (ycor (seg-beg s) )
		 )
		)
	
		(sqrt (+ (square dx ) (square dy) ) )
		)
	)
)

(define (+vector v1 v2)
	(make-vector(+ ( xcor v1) (xcor v2) )(+ (ycor v1) (ycor v2)) )
) 


(define (scale v1 s)
	(make-vector     (* s (xcor v1)  )
			 (* s ( ycor v2) ) 
	)
)
	

