(define (scale-list s l)
	(if (null? l) 
		'()	
	        (cons (* (car l) s)
		      (scale-list s (cdr l))
	
		)
	)
)
