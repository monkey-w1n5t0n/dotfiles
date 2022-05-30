(ns packages
  (:require [clojure.java.shell :as shell]))

(+ 1 2)



(do
  (println "/n~~~~~~~~~~~~~~~~")
  (let [command "pacman -Sii jack2"]
    (->>
     (shell/sh "bash" "-c" command)
     :out
     clojure.string/split-lines
     (map print)

     )))
