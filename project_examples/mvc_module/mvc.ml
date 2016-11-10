module type MVC = 
	sig
		type model = int
		type msg = Increment | Decrement
		val model : model
		val update : msg -> model -> model
		val view : model -> html
	end

let addition a b =

	
