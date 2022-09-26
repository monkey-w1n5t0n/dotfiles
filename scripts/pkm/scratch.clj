(ns pkm.scratch
  (:require [babashka.fs :as fs]
            [clojure.string :as str]))

(+ 1 2)

(def s
  ":PROPERTIES:
:ID:       fb7d07c6-ab9e-45ac-9afb-79266512f6c6
:mtime:    20220906003852 20220905025730 20220903150616 20220903132245 20220901210117
:ctime:    20220901210116
:END:
#+title: PKM/Scripts/Roadmap
#+filetags: :pkm:
* (Most likely going to be) Written in [[id:9216633d-2d80-4a90-8d9b-97424a45ffef][Clojure]] (and used with [[id:9fa2b2cd-8ef5-4fd4-9e20-b47c8a3fc8b9][Babashka]])
* [[id:70016c7b-4b4d-4063-a927-1f474b287b80][PKM Keywords]]
* Detect dates in multiple formats
* They need to be [[id:98242478-ad75-4321-87eb-f6d1a4f94cd9][Idempotent]]
* TODO Fix discrepancies in hierarchies - some kind of interactive browser that asks for confirmation/correction
* TODO Change hierarchy separator from : to /")

(re-groups #"#\+title: [.]*" s)



(defn org-doc-title [contents]
  (second (re-find  #"#\+title: (.*)\n" contents)))

(def test  "clj.lang.concurrency:send Vs. send-off")


(def test-title "clj.lang.concurrency.agent:send")


(def test-source ":PROPERTIES:
:ID:       75b7bc1f-d307-4814-8c95-9cc9860b2fbc
:mtime:    20220903003556
:ctime:    20220903003555
:END:
#+title: clj.lang.concurrency.agent:send")


(def test-body ":PROPERTIES:
:ID:       ebd85edf-c324-4eb6-9c47-a098382dcd96
:mtime:    20220903003733
:ctime:    20220903003731
:END:
#+title: clj.lang:Dynamic Binding
* [[https://clojure.org/reference/vars#conveyance][Binding Conveyance]]
[[id:39b78813-783b-4c23-b4f9-63e53cbdd809][Futures]] and [[id:11b1367c-5633-47b1-9905-1f953aaa8429][agents]] can carry over dynamic bindings from their parent thread to continue working asynchronously with the same environment.

This functionality is provided by [[id:39b78813-783b-4c23-b4f9-63e53cbdd809][future]], [[id:75b7bc1f-d307-4814-8c95-9cc9860b2fbc][send]], [[id:9e9af1ec-b5c6-4847-a094-165fc2891b95][send-off]], and [[id:5f823be0-7c3c-48ce-8e2f-f7729af7f698][pmap]].
")

(defn org-doc-id [doc]
  (nth (re-find #":ID:(\s*) (\S*)" doc) 2))

(org-doc-id test-source)

(defn )

#"(?<=\\[{2}id:)([^\\]]*)([\\[\\]]{2})?([^\\]]*)"

(def re-org-roam-link #"(?x) (?=\[\[)  id:(\S)*  (?=\]) (?=\[) ([^\]]*) (?=\])  ")

(doseq [s (re-seq re-org-roam-link test-body)]
  (println s))

(re-seq #"(?=\[)(?=\[)(\S)*(?=\])(?=\])" test-body)

(def org-files (fs/glob (fs/path (fs/home)
                                 "notes/org-roam") "**.org"))

(doseq [f (take 50 org-files)]
  (let [contents (slurp f)]
    (println (str "File: " (.toString f)))
    (doseq [link (re-seq #"\[(?=\[)(\S)*(?=\])(.*)?     \]" contents)]
      (println link))))

(let [source-doc test-source
      target test-body
      source-id (org-doc-id source-doc)]
  (println (str/replace target #"" )))

(defn change-hierarchy-separator
  "From can be a list, to should be a single character"
  [from to string]
  ;; TODO use arguments
  ;; TODO how to specify regex using `str`?
  ;; Match all `.` or `:` that are immediately preceeded
  ;; and followed by a non-space character and change them to `/`
  (str/replace string #"(?=\S)[.:](?=dS)" "/"))
