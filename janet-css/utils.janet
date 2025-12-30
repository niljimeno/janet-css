(defn rev-filter
  "Filter that only accepts elements that fail the condition"
  [f val]
  (filter
   (partial |(-> $ f not))
   val))
