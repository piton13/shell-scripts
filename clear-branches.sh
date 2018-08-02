#!/bin/bash
# CONDITION=PS-
CONDITION=FP-
for branch in `git branch -a | grep $CONDITION | sed 's/remotes\///'`; do
	git branch -d -r $branch
done
