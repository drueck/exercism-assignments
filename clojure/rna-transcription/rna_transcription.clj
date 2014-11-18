(ns rna-transcription)

(def rna-complements {\C \G, \A \U, \G \C, \T \A})

(defn- rna-complement [dna-nucleotide]
  {:pre [(rna-complements dna-nucleotide)]}
  (rna-complements dna-nucleotide))

(defn to-rna [dna]
  (apply str (map rna-complement dna)))
