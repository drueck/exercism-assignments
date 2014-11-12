(ns rna-transcription
  (require [clojure.string :as string]))

(def invalid-dna #"[^CAGT]")

(def rna-complements {\C \G,
                      \A \U,
                      \G \C,
                      \T \A})

(defn- rna-complement [dna-nucleotide]
  (get rna-complements dna-nucleotide))

(defn- validate-dna [dna]
  (assert (not (re-find invalid-dna dna))))

(defn to-rna [dna]
  (validate-dna dna)
  (string/join (map rna-complement dna)))
