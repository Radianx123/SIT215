(define (problem letseat-simple)
	(:domain letseat)
	(:objects
	arm - robot
	cupcake - cupcake
    cupcake2 - cupcake
	table - location
	plate - location
    unicorn - animals
	)

	(:init
		(on arm table)
        (on unicorn plate)
		(on cupcake table)
        (on cupcake2 table)
		(arm-empty)
		(path table plate)
        (path plate table)
        
	)
	(:goal  (and
            (eaten cupcake)
            (eaten cupcake2)
        )
	)
)