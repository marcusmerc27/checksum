LAUNCH=open -a
EDITOR="/Applications/Sublime Text.app"

all: review

compile: checksum.java
	javac checksum.java

execute: compile
	java checksum < 156.txt
	java checksum < 229.txt
	java checksum < 81.txt

review: execute
	$(LAUNCH) $(EDITOR) checksum.java

