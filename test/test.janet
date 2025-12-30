(import ../janet-css/css)

(print
 (css/into-css
  [:body
   [:color "black"]
   [:.text
    [:color "red"]]
   ["h1#title"
    [:color "magenta"]
    [:font-size "14px"]]]
  [:root
   [:color "purple"]]))
