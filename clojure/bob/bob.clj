(ns bob)

(defn- is-silence [message]
  (= (.trim message) ""))

(defn- is-shout [message]
  (and
    (= (.toUpperCase message) message)
    (not (= (.toLowerCase message) message))))

(defn- is-question [message]
  (.endsWith message "?"))

(defn response-for [message]
  (cond
    (is-silence message) "Fine. Be that way!"
    (is-shout message) "Woah, chill out!"
    (is-question message) "Sure."
    :else "Whatever."))
