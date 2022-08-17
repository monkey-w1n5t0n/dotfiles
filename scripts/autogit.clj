#!/usr/bin/bb
(require '[clojure.java.shell :refer [sh with-sh-dir]])

(def git-bin-path "/usr/bin/git")

(defn run-git
  ([repo command]
   (with-sh-dir repo
     (sh git-bin-path command)))
  ([git-dir work-tree command]
   (sh git-bin-path
       (str "--git-dir=" git-dir)
       (str "--work-tree=" work-tree)
       command)))

;; TODO DRY!!!!
(defn get-repo-branch
  ([repo]
   (->> (run-git "/home/w1n5t0n/research" "status")
        :out
        (re-find #"On branch (.*)\n")
        second))
  ([git-dir work-dir]
   (->> (run-git git-dir work-dir "status")
        :out
        (re-find #"On branch (.*)\n")
        second)))


(get-repo-branch "/home/w1n5t0n/.local/research-autocommit")

(defn get-repo-branches [path]
 (->> (run-git path "branch")
      :out
      (re-seq #"[\S]{2,}")
      ;; (map second)
      (into #{})))

(get-repo-branches "/home/w1n5t0n/.local/research-autocommit/")
(get-repo-branches "/home/w1n5t0n/research/")
(get-repo-branches "/home/w1n5t0n/TODELETE/test")


(sh git-bin-path )

(binding [*command-line-args*
          '("/home/w1n5t0n/.local/research-autocommit" "/home/w1n5t0n/research")]
  (let [[git-dir work-tree] *command-line-args*
        command-body (str "--git-dir=" git-dir " --work-tree=" work-tree)

        git-dir-branch (get-repo-branch git-dir work-tree)
        work-tree-branch (get-repo-branch work-tree)

        different-branches? (not (= git-dir-branch work-tree-branch))
        git-dir-branches (get-repo-branches git-dir)
        ]
    (println (str "Git-dir branch: " git-dir-branch))
    (println (str "Work-tree branch: " work-tree-branch))
    (println (str "Different branches? " different-branches?))
    (if different-branches?
      (run-git git-dir work-tree ))
    ;; (sh git-path "status")
    ))
