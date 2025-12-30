(import ../janet-css/css)

(print
 (css/into-css
  [:body
   [:color "black"]
   [:h1
    [:color "red"]]]
  [:root
   [:color "purple"]]))
