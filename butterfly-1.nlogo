globals [q]

patches-own [ elevation ]

turtles-own []

to setup
   ca
   ask patches
     [
       let elev1 100 - distancexy 30 30
       let elev2 50  - distancexy 120 100
       
       ifelse elev1 > elev2 
         [set elevation elev1]
         [set elevation elev2]
         
       set pcolor scale-color green elevation 0 100
       show (word elev1 " " elev2 " " elevation)
     ]
     
     crt 1 
      [
        set size 3
        setxy 85 95
        set color red
        pen-down
      ]
     reset-ticks
     set q .1
end

to go 
  ask turtles [move] ; A turtle procedure
  tick
  if ticks >= 1000 [stop]
end

to move
  ifelse random-float 1 < q
    [uphill elevation]
    [move-to one-of neighbors]
end
