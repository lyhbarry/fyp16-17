module type Button_mvc = sig
  val msg : string
end

module Button_mvc = struct
  let msg = "Hello!\n"
end  