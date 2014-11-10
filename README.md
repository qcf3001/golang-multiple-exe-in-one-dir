golang-multiple-exe-in-one-dir
==============================

Standard golang tooling (circa v1.4) builds multiple files within a single directory that have the same packagename into one object.   Buildall.bash demonstrates an approach to relax that constraint, no less idiomatically than "golang build constraints (http://golang.org/pkg/go/build/") for the case when you want to keep sources of multiple executables in the same directory.

Each "package main" file should have a "main constraint" :
     package main // +main-foo
to indicate it is part of executable "foo".

Executables are built in temp subdirs.
