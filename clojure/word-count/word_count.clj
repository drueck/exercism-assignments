(ns word-count
  (require [clojure.string :as str]))

(def non-word-characters #"[^\p{L}\p{N}]+")

(defn- split-into-lowercase-words [string]
  (str/split (str/lower-case string) non-word-characters))

(defn word-count [string]
  (frequencies (split-into-lowercase-words string)))
