
(cl:in-package :asdf)

(defsystem "maze-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "det_srv" :depends-on ("_package_det_srv"))
    (:file "_package_det_srv" :depends-on ("_package"))
    (:file "solver" :depends-on ("_package_solver"))
    (:file "_package_solver" :depends-on ("_package"))
  ))