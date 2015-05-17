;Start with wishful thinking. (HOPE it works :) )


(define (DERIV EXP VAR)
	(COND (( CONSTANT? EXP VAR ) 0)
	      ((SAME-VAR? EXP VAR ) 1 )
	      ((SUM? EXP)
			(MAKE-SUM (DERIV (A1 EXP) VAR) 
				  (DERIV (A2 EXP) VAR)
			)
		)
	       ((PRODUCT? EXP)
			(MAKE-SUM
				(MAKE-PRODUCT (M1 EXP) (DERIV (M2 EXP) VAR) )
				(MAKE-PRODUCT (DERIV (M1 EXP) (VAR) ) (M2 EXP) )
			)
			;etc . More rules can be added as we wish like differential of u/v 
		)
	)
)



		
;CONSTANT? procedure

(define (CONSTANT? EXP VAR)
	(AND (ATOM? EXP)	
	     (NOT (EQ? EXP VAR))
	)
)



;EXP is same variable if it is not atomic and the expression is equal to the variable of differentiation

(define (SAME-VAR? EXP VAR)
	(AND (ATOM? EXP)
	     (EQ? EXP VAR)
	)
)


;EXP is sum if it is not atomic and it contains '+' symbol

(define (SUM? EXP)
	(AND (NOT (ATOM? EXP)) 
	     (EQ? (CAR EXP) '+)	
	)
)


;MAKE-SUM builds a list with symbol EXP1 EXP2


(define (MAKE-SUM  A1 A2)
	(LIST '+ A1 A2)
)

(define A1 CADR) ; (car(cdr EXP))

(define A2 CADDR)  ;(CAR(CDR (CDR EXP ) ) )


;EXP is a product if it is not atomic and it contains '*' symbol
(define (PRODUCT? EXP)
	(AND (NOT (ATOM? EXP) )
	     (EQ (CAR EXP) '*)
	)
)

;builds a list of form (* M1 M2)

(define (MAKE-PRODUCT M1 M2)
	(LIST '* M1 M2)
)

(define M1 CADR)

(define M2 CADDR)


;An expression is atom if it is not a pair and it is not null
(define (ATOM? EXP)
	(AND (NOT (PAIR? EXP))
	     (NOT (NULL? EXP))
	)
)



