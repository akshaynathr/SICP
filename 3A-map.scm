(define (maping p l)
	(if (null? l)
		'()
		(cons (p (car l) )
		      (map p (cdr l) )
		)
	)
)


(define (for-each proc list)
	(cond ( (null? list) "done")
	        (else (proc (car list) )
		       (for-each proc 
				 (cdr list )
			)
		)
		)
)
