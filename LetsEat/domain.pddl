(define (domain letseat)
  
  (:requirements :typing) 
  
  (:types         
    location locatable - object
		bot cupcake - locatable
    robot - bot
    animals - bot
  )
  
  (:predicates
		(on ?obj - locatable ?loc - location)
		(holding ?arm - locatable ?cupcake - locatable)
    (arm-empty)
    (path ?location1 - location ?location2 - location)
    (eaten ?cupcake - locatable)
  )

  (:action eat ;eat cupcake action
    :parameters
     (?cupcake - locatable
      ?unicorn - animals
      ?loc - location)
    :precondition
     (and 
        (on ?cupcake ?loc)
        (on ?unicorn ?loc) ;is the cupcake on the same place with unicorn?
      )
    :effect
     (and 
        (eaten ?cupcake) ;unicorn eat the cupcake
        (not (on ?cupcake ?loc))
     )
  )

  (:action pick-up
    :parameters
     (?arm - robot
      ?cupcake - cupcake
      ?loc - location)
    :precondition
     (and 
        (on ?arm ?loc) 
        (on ?cupcake ?loc)
        (arm-empty)
      )
    :effect
     (and 
        (not (on ?cupcake ?loc))
        (holding ?arm ?cupcake)
        (not (arm-empty))
     )
  )

  (:action drop
    :parameters
     (?arm - robot
      ?cupcake - cupcake
      ?loc - location)
    :precondition
     (and 
        (on ?arm ?loc)
        (holding ?arm ?cupcake)
      )
    :effect
     (and 
        (on ?cupcake ?loc)
        (arm-empty)
        (not (holding ?arm ?cupcake))
     )
  )

  (:action move
    :parameters
     (?arm - robot
      ?from - location
      ?to - location)
    :precondition
     (and 
      (on ?arm ?from) 
      (path ?from ?to)
     )
    :effect
     (and 
      (not (on ?arm ?from))
      (on ?arm ?to)
     )
  )
)