(defn is-element?
  [val]
  (indexed? (val 1)))

(defn rev-filter
  "Filter that only accepts elements that fail the condition"
  [f val]
  (filter
   (partial |(-> $ f not))
   val))

(defn element-name
  "Fixes element name (in case of :root)"
  [val]
  (if (= val :root)
    ":root"
    val))

(defn make-attribute
  `Turn attribute array into string.
  Example: [:color "red"] -> "color: red")`
  [val]
  (string "\t"
          (val 0) ": "
          (val 1) ";\n"))

(defn make-element
  `Turn element array into string, processes inner elements recursively.
  Example: [:body [...] ...] -> "body { ... }"`
  [val &opt & depth]
  (default depth [])
  (let [name (element-name (first val))
        next (drop 1 val)]
    (string (string/join [;depth name] ", ")
            " {\n"
            ;(map make-attribute
                  (rev-filter is-element? next))
            "}\n\n"
            ;(map
              (partial |(make-element $ ;depth name))
              (filter is-element? next)))))


(defn into-css
  "Transform Janet arrays into strings"
  [& val]
  (string
   ;(map
     (fn [x] ((if (is-element? x)
                make-element
                make-attribute) x))
     val)))

(defn main
  [& args]
  (print (into-css [:body
                    [:color "black"]
                    [:h1
                     [:color "red"]]]
                   [:root
                    [:color "purple"]])))
