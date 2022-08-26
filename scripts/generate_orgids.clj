(require '[babashka.fs :as fs])

(def dirs ["notes/org" "notes/org-roam"])

(def files (apply concat (for [dir dirs]
                            (map str (fs/glob dir "**{.org}")))))

(def num-files (count files))


(defn get-org-file-ids [file]
  (re-find #":ID:[\s]*(.*)\n" (slurp file)))

(def pairs (for [file files]
              (let [search-results (get-org-file-ids file)]
                (when (> (count search-results) 2)
                  (println (str "File " file " had more than 2 results: " search-results)))
                (if search-results
                  {:file (clojure.string/replace-first file #"notes" "..")
                   :id (nth search-results 1)}))

              ))

(def output-file "notes/generated-org-ids.txt")

(comment
  (do
    (spit output-file "")
    (spit output-file "(" :append true)
    (doseq [pair pairs]
      (when pair
        (println pair)
        (spit output-file "(" :append true)
        (spit output-file (str "\"" (:file pair) "\" ") :append true)
        (spit output-file (str "\"" (:id pair) "\"") :append true)
        (spit output-file ") " :append true)))
    (spit output-file ")" :append true)
    ))
