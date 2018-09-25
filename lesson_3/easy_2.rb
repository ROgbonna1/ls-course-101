
## Question 10 ##
row_length = 40
title = "Flintstone Family Members"
space_offset = ( row_length - title.length ) / 2
space_offset.times { title.prepend(" ") }
puts title
40.times { print "-"}