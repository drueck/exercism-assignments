(ns word-count
  (require [clojure.string :as str]))

(def non-word-characters #"[^\p{L}\p{N}]+")

(defn- split-into-lowercase-words [string]
  (str/split (str/lower-case string) non-word-characters))

(defn- count-word [counts word]
  (assoc counts word (inc (get counts word 0))))

(defn word-count [string]
  (reduce count-word {} (split-into-lowercase-words string)))
