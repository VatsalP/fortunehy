#!/usr/bin/env hy

(import [bottle [
  route 
  run 
  mako_view :as view 
  static_file
]])
(import [sh [fortune]])

#@((route "/get_fortune")
  (defn getfortune []
    (string (fortune "-as"))
  )
)

#@((route "/") (view "index.html") 
  (defn index []
    {}
  )
)

#@((route "/static/<filename:path>")
  (defn send_static [filename]
    (static_file 
      filename
      :root "./resources"
    )
  )
)

(run :port 8080)
