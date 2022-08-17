#!/usr/bin/bb
(require '[clojure.java.shell :refer [sh with-sh-dir]])

(def main-repo "/home/w1n5t0n/.local/research-main")
(def auto-repo "/home/w1n5t0n/.local/research-autocommit/")
(def work-tree "/home/w1n5t0n/research")
(def test-dir "/home/w1n5t0n/TODELETE/test")

(defn start-watching [dir]
  (sh "inotifywait" "-e modify,create,move,delete" "-r" dir))

(println )
(start-watching test-dir)
