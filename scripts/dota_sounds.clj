#!/usr/bin/env bb

(require '[babashka.fs :as fs])

(defn append-to-file [f s]
  (spit f (str/join "\n"
                [(slurp f) s])))

(def decompiler-path "/home/w1n5t0n/Downloads/Decompiler-linux-x64/decompiler")
(def new-ext ".wav")
(def output-dir "/run/media/w1n5t0n/Blade 15 HDD/samples/dota2-parallel/")
(def log-file (str output-dir "log.txt"))
(def root-path-str "/run/media/w1n5t0n/INTENSO/dota 2 sounds/")
(def root-path
  (fs/path root-path-str))

(assert (fs/directory? root-path))

(println "Searching recursively for all .vsndc_c files...")

(def sound-files
  (fs/glob root-path "**.vsnd_c"))

(def num-files (count sound-files))

(println (str "Found " (count sound-files) " sound files."))

(println "Processing...")

(defn make-sh-command [& args]
 (str/join " " args))

(defn make-sh-string [s]
  (str "'" s "'"))

;; Clear log file
(spit log-file "")

;; Process
(doall (pmap (fn [[i f]]
               (let [percentage (float (* 100 (/ i (dec num-files))))
                     filepath (str f)
                     filename (fs/file-name f)
                     parent-path-absolute (fs/parent f)
                     parent-path-relative (-> (str parent-path-absolute)
                                              (str/replace root-path-str ""))

                     new-parent-path (str output-dir parent-path-relative)
                     new-filename (-> filename fs/strip-ext (str ".wav"))
                     new-filepath (str new-parent-path "/" new-filename)]
                 ;; (println (str "Filepath: " (make-sh-string (str  (fs/canonicalize filepath)))))
                 (fs/create-dirs new-parent-path)
                 ;; (println command)
                 (shell/sh "bash" "-c"
                            (str  decompiler-path
                                  " -i " (make-sh-string filepath)
                                  " -o " (make-sh-string new-filepath)))))
             (map-indexed vector sound-files)))
