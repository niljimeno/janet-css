(use ./internals)

(defn into-css
  "Transform Janet arrays into strings"
  [& val]
  (string
   ;(map
     (fn [x] ((if (is-element? x)
                make-element
                make-attribute) x))
     val)))
